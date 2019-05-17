Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF20D2191F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 15:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbfEQNZu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 09:25:50 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:35512 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbfEQNZu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 09:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558099546;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=25UD9iI7zNHSpTnOzoI4qzXICN+AB2At4WQ+Y/l6aak=;
        b=ooIk7YTztQ8gseYjZZ7IOSdP5qnoQPOrqh7lwqT3Gx7mlhX5h/lTwAp/Qu8x4jbEMi
        z0s6snm0+5sSaRDG0JyExId26EWSUwfKt+XBn6ymt176Z0HeTfeHzaaw5cVkmS5vZSCC
        3Id0m9zxCuZZuef1/sPEUIlCPxI9tES1+rbJLqZubKm5HVl3VZW5QFKreqmYnE09hYSy
        BSLO4rFHr/2dNw1xtpq2XnftPYXPnlnwLCxXn8mUQ4En201mLeXtfXLbOk447nW0bss8
        NeThSuDK1dKfFzrv1t356TQOEkjTnorRN+3R0AdcuYDf+z6rZVswTpVlRrnT7tJ5FAHd
        piMw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v4HDPjxsu
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 17 May 2019 15:25:45 +0200 (CEST)
Date:   Fri, 17 May 2019 15:25:45 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Biju Das <biju.das@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Message-ID: <393903256.22544.1558099545054@webmail.strato.com>
In-Reply-To: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
References: <1558012923-29081-1-git-send-email-biju.das@bp.renesas.com>
Subject: Re: [PATCH v2] phy: renesas: phy-rcar-gen2: Fix the array off by
 one warning
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.135.150
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On May 16, 2019 at 3:22 PM Biju Das <biju.das@bp.renesas.com> wrote:
> 
> 
> Fix the below smatch warning by adding variable check rather than the
> hardcoded value.
> warn: array off by one? 'data->select_value[channel_num]'
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> V1-->V2 
>   * Incorporated Geert's review comments.
>     (https://patchwork.kernel.org/patch/10944837/)
> ---
>  drivers/phy/renesas/phy-rcar-gen2.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
> index 8dc5710..8dbdc5b 100644
> --- a/drivers/phy/renesas/phy-rcar-gen2.c
> +++ b/drivers/phy/renesas/phy-rcar-gen2.c
> @@ -71,6 +71,7 @@ struct rcar_gen2_phy_driver {
>  struct rcar_gen2_phy_data {
>  	const struct phy_ops *gen2_phy_ops;
>  	const u32 (*select_value)[PHYS_PER_CHANNEL];
> +	const u32 num_channels;
>  };
>  
>  static int rcar_gen2_phy_init(struct phy *p)
> @@ -271,11 +272,13 @@ static const u32 usb20_select_value[][PHYS_PER_CHANNEL] = {
>  static const struct rcar_gen2_phy_data rcar_gen2_usb_phy_data = {
>  	.gen2_phy_ops = &rcar_gen2_phy_ops,
>  	.select_value = pci_select_value,
> +	.num_channels = ARRAY_SIZE(pci_select_value),
>  };
>  
>  static const struct rcar_gen2_phy_data rz_g1c_usb_phy_data = {
>  	.gen2_phy_ops = &rz_g1c_phy_ops,
>  	.select_value = usb20_select_value,
> +	.num_channels = ARRAY_SIZE(usb20_select_value),
>  };
>  
>  static const struct of_device_id rcar_gen2_phy_match_table[] = {
> @@ -389,7 +392,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
>  		channel->selected_phy = -1;
>  
>  		error = of_property_read_u32(np, "reg", &channel_num);
> -		if (error || channel_num > 2) {
> +		if (error || channel_num >= data->num_channels) {
>  			dev_err(dev, "Invalid \"reg\" property\n");
>  			return error;
>  		}
> -- 
> 2.7.4
>

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
