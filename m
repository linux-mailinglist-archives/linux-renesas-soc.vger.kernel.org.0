Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99D8D88456
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2019 22:59:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbfHIU7r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Aug 2019 16:59:47 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:40118 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfHIU7r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Aug 2019 16:59:47 -0400
Received: from penelope.horms.nl (unknown [66.60.152.14])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5A9FF25AEE2;
        Sat, 10 Aug 2019 06:59:44 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 28777E21D63; Fri,  9 Aug 2019 22:59:43 +0200 (CEST)
Date:   Fri, 9 Aug 2019 13:59:43 -0700
From:   Simon Horman <horms@verge.net.au>
To:     marek.vasut@gmail.com
Cc:     linux-pci@vger.kernel.org, Oza Pawandeep <oza.oza@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI/of fix of_dma_get_range; get PCI specific
 dma-ranges
Message-ID: <20190809205942.wqm4clwnn5stdrug@verge.net.au>
References: <20190809173449.20126-1-marek.vasut@gmail.com>
 <20190809173449.20126-2-marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809173449.20126-2-marek.vasut@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 09, 2019 at 07:34:49PM +0200, marek.vasut@gmail.com wrote:
> From: Oza Pawandeep <oza.oza@broadcom.com>
> 
> current device framework and OF framework integration assumes
> dma-ranges in a way where memory-mapped devices define their
> dma-ranges. (child-bus-address, parent-bus-address, length).
> 
> of_dma_configure is specifically written to take care of memory
> mapped devices. but no implementation exists for pci to take
> care of pcie based memory ranges.
> 
> for e.g. iproc based SOCs and other SOCs(such as rcar) have PCI
> world dma-ranges.
> dma-ranges = <0x43000000 0x00 0x00 0x00 0x00 0x80 0x00>;
> 
> this patch fixes the following problems of_dma_get_range.
> 1) return of wrong size as 0.
> 2) not handling absence of dma-ranges which is valid for PCI master.
> 3) not handling multipe inbound windows.
> 4) in order to get largest possible dma_mask. this patch also
> retuns the largest possible size based on dma-ranges,
> 
> for e.g.
> dma-ranges = <0x43000000 0x00 0x00 0x00 0x00 0x80 0x00>;
> we should get dev->coherent_dma_mask=0x7fffffffff.
> 
> based on which IOVA allocation space will honour PCI host
> bridge limitations.
> 
> the implementation hooks bus specific callbacks for getting
> dma-ranges.
> 
> Signed-off-by: Oza Pawandeep <oza.oza@broadcom.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pci@vger.kernel.org
> ---
>  drivers/of/address.c | 220 +++++++++++++++++++++++++++++--------------
>  1 file changed, 150 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 55a4eb7786ca..ae2819e148b8 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_pci.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/sizes.h>
> @@ -48,6 +49,8 @@ struct of_bus {
>  				int na, int ns, int pna);
>  	int		(*translate)(__be32 *addr, u64 offset, int na);
>  	unsigned int	(*get_flags)(const __be32 *addr);
> +	int		(*get_dma_ranges)(struct device_node *np,
> +					  u64 *dma_addr, u64 *paddr, u64 *size);
>  };
>  
>  /*
> @@ -174,6 +177,143 @@ static int of_bus_pci_translate(__be32 *addr, u64 offset, int na)
>  	return of_bus_default_translate(addr + 1, offset, na - 1);
>  }
>  
> +static int of_bus_pci_get_dma_ranges(struct device_node *np, u64 *dma_addr,
> +				     u64 *paddr, u64 *size)
> +{
> +	struct device_node *node = of_node_get(np);
> +	int ret = 0;
> +	struct resource_entry *window;
> +	LIST_HEAD(res);
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	*size = 0;
> +	/*
> +	 * PCI dma-ranges is not mandatory property.
> +	 * many devices do no need to have it, since
> +	 * host bridge does not require inbound memory
> +	 * configuration or rather have design limitations.
> +	 * so we look for dma-ranges, if missing we
> +	 * just return the caller full size, and also
> +	 * no dma-ranges suggests that, host bridge allows
> +	 * whatever comes in, so we set dma_addr to 0.
> +	 */
> +	ret = of_pci_get_dma_ranges(np, &res);
> +	if (!ret) {
> +		resource_list_for_each_entry(window, &res) {

		The { should appear on a newline and
		This block should be indented by one more tab.
		Or the scope of res_dma could be moved and
		this extra block avoided.

> +		struct resource *res_dma = window->res;
> +
> +		if (*size < resource_size(res_dma)) {
> +			*dma_addr = res_dma->start - window->offset;
> +			*paddr = res_dma->start;
> +			*size = resource_size(res_dma);
> +			}
> +		}
> +	}
> +	pci_free_resource_list(&res);
> +
> +	/*
> +	 * return the largest possible size,
> +	 * since PCI master allows everything.
> +	 */
> +	if (*size == 0) {
> +		pr_debug("empty/zero size dma-ranges found for node(%s)\n",
> +			np->full_name);
> +		*size = DMA_BIT_MASK(sizeof(dma_addr_t) * 8) - 1;
> +		*dma_addr = *paddr = 0;
> +		ret = 0;
> +	}
> +
> +	pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> +		 *dma_addr, *paddr, *size);
> +
> +	of_node_put(node);
> +
> +	return ret;
> +}
> +
> +static int get_dma_ranges(struct device_node *np, u64 *dma_addr,
> +				u64 *paddr, u64 *size)
> +{
> +	struct device_node *node = of_node_get(np);
> +	const __be32 *ranges = NULL;
> +	int len, naddr, nsize, pna;
> +	int ret = 0;
> +	u64 dmaaddr;
> +
> +	if (!node)
> +		return -EINVAL;
> +
> +	while (1) {
> +		naddr = of_n_addr_cells(node);
> +		nsize = of_n_size_cells(node);
> +		node = of_get_next_parent(node);
> +		if (!node)
> +			break;
> +
> +		ranges = of_get_property(node, "dma-ranges", &len);
> +
> +		/* Ignore empty ranges, they imply no translation required */
> +		if (ranges && len > 0)
> +			break;
> +
> +		/*
> +		 * At least empty ranges has to be defined for parent node if
> +		 * DMA is supported
> +		 */
> +		if (!ranges)
> +			break;
> +	}
> +
> +	if (!ranges) {
> +		pr_debug("no dma-ranges found for node(%s)\n", np->full_name);
> +		ret = -ENODEV;
> +		goto out;
> +	}
> +
> +	len /= sizeof(u32);
> +
> +	pna = of_n_addr_cells(node);
> +
> +	/* dma-ranges format:
> +	 * DMA addr	: naddr cells
> +	 * CPU addr	: pna cells
> +	 * size		: nsize cells
> +	 */
> +	dmaaddr = of_read_number(ranges, naddr);
> +	*paddr = of_translate_dma_address(np, ranges);
> +	if (*paddr == OF_BAD_ADDR) {
> +		pr_err("translation of DMA address(%pad) to CPU address failed node(%s)\n",
> +		       dma_addr, np->full_name);
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	*dma_addr = dmaaddr;
> +
> +	*size = of_read_number(ranges + naddr + pna, nsize);
> +
> +	pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> +		 *dma_addr, *paddr, *size);
> +
> +out:
> +	of_node_put(node);
> +
> +	return ret;
> +}
> +
> +static int of_bus_isa_get_dma_ranges(struct device_node *np, u64 *dma_addr,
> +				     u64 *paddr, u64 *size)
> +{
> +	return get_dma_ranges(np, dma_addr, paddr, size);
> +}
> +
> +static int of_bus_default_get_dma_ranges(struct device_node *np, u64 *dma_addr,
> +					 u64 *paddr, u64 *size)
> +{
> +	return get_dma_ranges(np, dma_addr, paddr, size);
> +}
> +
>  const __be32 *of_get_pci_address(struct device_node *dev, int bar_no, u64 *size,
>  			unsigned int *flags)
>  {
> @@ -438,6 +578,7 @@ static struct of_bus of_busses[] = {
>  		.map = of_bus_pci_map,
>  		.translate = of_bus_pci_translate,
>  		.get_flags = of_bus_pci_get_flags,
> +		.get_dma_ranges = of_bus_pci_get_dma_ranges,
>  	},
>  #endif /* CONFIG_PCI */
>  	/* ISA */
> @@ -449,6 +590,7 @@ static struct of_bus of_busses[] = {
>  		.map = of_bus_isa_map,
>  		.translate = of_bus_isa_translate,
>  		.get_flags = of_bus_isa_get_flags,
> +		.get_dma_ranges = of_bus_isa_get_dma_ranges,
>  	},
>  	/* Default */
>  	{
> @@ -459,6 +601,7 @@ static struct of_bus of_busses[] = {
>  		.map = of_bus_default_map,
>  		.translate = of_bus_default_translate,
>  		.get_flags = of_bus_default_get_flags,
> +		.get_dma_ranges = of_bus_default_get_dma_ranges,
>  	},
>  };
>  
> @@ -917,80 +1060,17 @@ EXPORT_SYMBOL(of_io_request_and_map);
>   *	size			: nsize cells
>   *
>   * It returns -ENODEV if "dma-ranges" property was not found
> - * for this device in DT.
> + * for this device in DT, except if PCI device then, dma-ranges
> + * can be optional property, and in that case returns size with
> + * entire host memory.
>   */
>  int of_dma_get_range(struct device_node *np, u64 *dma_addr, u64 *paddr, u64 *size)
>  {
> -	struct device_node *node = of_node_get(np);
> -	const __be32 *ranges = NULL;
> -	int len, naddr, nsize, pna;
> -	int ret = 0;
> -	u64 dmaaddr;
> -
> -	if (!node)
> -		return -EINVAL;
> -
> -	while (1) {
> -		struct device_node *parent;
> -
> -		naddr = of_n_addr_cells(node);
> -		nsize = of_n_size_cells(node);
> -
> -		parent = __of_get_dma_parent(node);
> -		of_node_put(node);
> -
> -		node = parent;
> -		if (!node)
> -			break;
> -
> -		ranges = of_get_property(node, "dma-ranges", &len);
> -
> -		/* Ignore empty ranges, they imply no translation required */
> -		if (ranges && len > 0)
> -			break;
> -
> -		/*
> -		 * At least empty ranges has to be defined for parent node if
> -		 * DMA is supported
> -		 */
> -		if (!ranges)
> -			break;
> -	}
> -
> -	if (!ranges) {
> -		pr_debug("no dma-ranges found for node(%pOF)\n", np);
> -		ret = -ENODEV;
> -		goto out;
> -	}
> -
> -	len /= sizeof(u32);
> -
> -	pna = of_n_addr_cells(node);
> -
> -	/* dma-ranges format:
> -	 * DMA addr	: naddr cells
> -	 * CPU addr	: pna cells
> -	 * size		: nsize cells
> -	 */
> -	dmaaddr = of_read_number(ranges, naddr);
> -	*paddr = of_translate_dma_address(np, ranges);
> -	if (*paddr == OF_BAD_ADDR) {
> -		pr_err("translation of DMA address(%pad) to CPU address failed node(%pOF)\n",
> -		       dma_addr, np);
> -		ret = -EINVAL;
> -		goto out;
> -	}
> -	*dma_addr = dmaaddr;
> -
> -	*size = of_read_number(ranges + naddr + pna, nsize);
> -
> -	pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> -		 *dma_addr, *paddr, *size);
> -
> -out:
> -	of_node_put(node);
> +	struct of_bus *bus;
>  
> -	return ret;
> +	/* get bus specific dma-ranges. */
> +	bus = of_match_bus(np);
> +	return bus->get_dma_ranges(np, dma_addr, paddr, size);
>  }
>  EXPORT_SYMBOL_GPL(of_dma_get_range);
>  
> -- 
> 2.20.1
> 
