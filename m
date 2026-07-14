Return-Path: <linux-renesas-soc+bounces-35220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ijFCHKdqVmq45AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:58:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF4D75729B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:58:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H+JXmQU3;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4B66301C96C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A8DC4DD6F8;
	Tue, 14 Jul 2026 16:58:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76DF4DD6F1;
	Tue, 14 Jul 2026 16:58:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784048293; cv=none; b=Uj6ctGZy/PlCqs7L6yd/RsIBFmVTB9MsxoAH3/+n0Ai/ImizLRyyZxTS4SV9dPvcELDGxDfDP8a/fUePCVmc+AGYTG8cNl60p6HowBVkfu+omLYgOfLyDu7nA8U7LNy9Nn/4awJjpaKbdnJb81Aqwj5ejrUiGaTFJsf8sH6tbdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784048293; c=relaxed/simple;
	bh=P8Zd6FtUrNthGPjMghbjyES0Yvahi4pU8HA3efbVLRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+GCsx49u+jdsX1JBgz9lhWnmj5GLcC5B/lC4NoWyqoyYgRYVVj9PhHsbuELY6yd/o9Cq5psRinn8aO4SgfPHW1EHHTIr5pDY6MNzldvYSLtuyHwOV/ZXlrowlMAw073oP3IWIDYXl00/ZtC3iRXVb3h0dXOP+oyfSStW5Ax0fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H+JXmQU3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7496F1F00A3A;
	Tue, 14 Jul 2026 16:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784048291;
	bh=q20ft91Ycu/VWgRF22VBx1iZLRZcJ442gUyDb9zb3bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+JXmQU3Aj2+0h2/Ut+qwTdtfGCoy7sxVgmWGvE+be244lKnbyiKn9dOCKao4UgzR
	 gpCXn0cSf+yqnJRB3Ky942EPVgXBGW86vkLpp74sVg7yYhxqKlD91iruEillzhqOVU
	 uDDmXPUQbFOCprlup+LyxKJ3wlUodu4bPzFbgThfT/HBsFXPVsPiinbot+zCPL7AKX
	 h+P314rSVzblZ5lncjHtKX5EnU9ImmIDaSFwybJwi3h323zPrndW/WclbgMRFFqlqH
	 5iCJt58xHMWmqp9JwmI4kFgaE+OwAgEu0mKU1PHmb0YD4Z13jMEoGVCJGV2gfn8IkZ
	 VZDKEHz6b8dsw==
Date: Tue, 14 Jul 2026 18:58:02 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, robh@kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, john.madieu@gmail.com, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
Subject: Re: [PATCH v2] PCI: rzg3s-host: Re-enumerate the bus on PCIe
 link-state changes
Message-ID: <aifual6ttxnrbi3o3lrnprwinmhvkysmebzrscoxhyhxbaqkz5@l66w7bdechqz>
References: <20260630141720.3938514-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630141720.3938514-1-john.madieu.xa@bp.renesas.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35220-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDF4D75729B

On Tue, Jun 30, 2026 at 02:17:20PM +0000, John Madieu wrote:
> The RZ/G3E PCIe controller does not expose the standard PCIe Slot
> Capability registers, so the generic pciehp driver cannot be used. The
> only link-state signal the hardware provides is the DL_UpDown bit in the
> PEIS0 event status register, which is raised on every Data Link layer
> up/down transition.
> 
> Enable DL_UpDown in PEIE0 and hook up an interrupt handler so the driver
> can react to link-state changes: a device that trains after boot gets
> enumerated, and a device that disappears on link loss is removed. This
> provides hotplug-like behaviour without the PCI hotplug core, which is
> unavailable for the reason above.
> 
> On a DL_UpDown event the handler acks the W1C status bit and schedules a
> worker that inspects PCSTAT1.DL_DOWN_STS:
> 
>   - link up: re-run max link speed negotiation, wait for the link to
>     settle and pci_rescan_bus() the root bus;
>   - link down: walk the bus in reverse and
>     pci_stop_and_remove_bus_device() each child.
> 
> Both paths take pci_lock_rescan_remove() to serialise against the PCI
> core.
> 
> Link events are only acted upon once the controller is fully
> initialised. A DL_UpDown latched while the registers are not configured,
> for example when the event IRQ is used as a system wakeup source during
> resume, is acknowledged but does not schedule a rescan.

This is not correct. I don't see the patch configuring 'event IRQ' as a wakeup
source.

Rest of the patch LGTM. If you confirm above, I can reword while applying.

- Mani

> The
> hw_initialized flag, set at the end of controller setup and cleared on
> suspend, gates this.
> 
> While at it, make probe tolerant of an absent device. Previously, if the
> link failed to come up during rzg3s_pcie_host_init(), probe tore the
> controller back down and failed. Distinguish this case with -ENODEV,
> leave the controller and refclk running, and let the link-up path
> enumerate the device once it appears.
> 
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
> This patch applies on top of the RZ/V2H(P) PCIe series:
> 
>   [PATCH v5 0/4] Add PCIe support for RZ/V2H(P) SoC
>   https://lore.kernel.org/r/20260629220932.861445-1-prabhakar.mahadev-lad.rj@bp.renesas.com
> 
> Changes in v2:
> - Rebased on top of the RZ/V2H(P) PCIe support series from Lad
>   Prabhakar. No functional change.
> 
>  drivers/pci/controller/pcie-rzg3s-host.c | 153 +++++++++++++++++++++--
>  1 file changed, 143 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index 8187a82..80e0c0d 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -34,6 +34,7 @@
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
>  #include <linux/units.h>
> +#include <linux/workqueue.h>
> 
>  #include "../pci.h"
> 
> @@ -322,7 +323,12 @@ struct rzg3s_pcie_port {
>   * @msi: MSI data structure
>   * @port: PCIe Root Port
>   * @hw_lock: lock for access to the HW resources
> + * @link_work: work for DL_UpDown link-state change handling
> + * @event_irq: PCIe event interrupt for DL_UpDown detection
>   * @intx_irqs: INTx interrupts
> + * @hw_initialized: set once the controller HW is fully initialised; gates
> + *                  DL_UpDown event handling against events latched while
> + *                  the registers are not configured
>   * @max_link_speed: maximum supported link speed
>   * @controller_id: PCIe controller identifier, used for System Controller access
>   * @num_lanes: The number of lanes
> @@ -339,7 +345,10 @@ struct rzg3s_pcie_host {
>  	struct rzg3s_pcie_msi msi;
>  	struct rzg3s_pcie_port port;
>  	raw_spinlock_t hw_lock;
> +	struct work_struct link_work;
> +	int event_irq;
>  	int intx_irqs[PCI_NUM_INTX];
> +	bool hw_initialized;
>  	int max_link_speed;
>  	enum rzg3s_pcie_controller_id controller_id;
>  	u8 num_lanes;
> @@ -619,6 +628,30 @@ static irqreturn_t rzg3s_pcie_msi_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
> 
> +static irqreturn_t rzg3s_pcie_event_irq(int irq, void *data)
> +{
> +	struct rzg3s_pcie_host *host = data;
> +	u32 status;
> +
> +	status = readl_relaxed(host->axi + RZG3S_PCI_PEIS0);
> +
> +	if (!(status & RZG3S_PCI_PEIS0_DL_UPDOWN))
> +		return IRQ_NONE;
> +
> +	/* Clear the DL_UpDown status (W1C) */
> +	writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIS0);
> +
> +	/*
> +	 * Drop the event until the controller is fully initialised. The
> +	 * event IRQ may act as a system wakeup source and fire during
> +	 * resume before the HW registers have been reconfigured.
> +	 */
> +	if (READ_ONCE(host->hw_initialized))
> +		schedule_work(&host->link_work);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static void rzg3s_pcie_msi_irq_ack(struct irq_data *d)
>  {
>  	struct rzg3s_pcie_msi *msi = irq_data_get_irq_chip_data(d);
> @@ -1151,6 +1184,47 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
>  	return ret;
>  }
> 
> +static void rzg3s_pcie_link_work(struct work_struct *work)
> +{
> +	struct rzg3s_pcie_host *host =
> +		container_of(work, struct rzg3s_pcie_host, link_work);
> +	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> +	struct pci_bus *bus = bridge->bus;
> +	u32 val;
> +
> +	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT1);
> +	if (val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS) {
> +		struct pci_dev *dev, *tmp;
> +
> +		dev_info(host->dev, "PCIe link down, removing devices\n");
> +
> +		pci_lock_rescan_remove();
> +		list_for_each_entry_safe_reverse(dev, tmp,
> +						 &bus->devices, bus_list)
> +			pci_stop_and_remove_bus_device(dev);
> +		pci_unlock_rescan_remove();
> +	} else {
> +		int ret;
> +
> +		dev_info(host->dev, "PCIe link up, rescanning bus\n");
> +
> +		/*
> +		 * Attempt link speed negotiation now that the link is up.
> +		 * Failure is non-fatal: the device works at the negotiated
> +		 * speed.
> +		 */
> +		ret = rzg3s_pcie_set_max_link_speed(host);
> +		if (ret)
> +			dev_info(host->dev, "Failed to set max link speed\n");
> +
> +		msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +
> +		pci_lock_rescan_remove();
> +		pci_rescan_bus(bus);
> +		pci_unlock_rescan_remove();
> +	}
> +}
> +
>  static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>  {
>  	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> @@ -1268,8 +1342,8 @@ static void rzg3s_pcie_irq_init(struct rzg3s_pcie_host *host)
>  		       RZG3S_PCI_PEIS0_RX_DLLP_PM_ENTER,
>  		       host->axi + RZG3S_PCI_PEIS0);
> 
> -	/* Disable all interrupts */
> -	writel_relaxed(0, host->axi + RZG3S_PCI_PEIE0);
> +	/* Enable DL_UpDown interrupt for link state change detection */
> +	writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_PEIE0);
> 
>  	/* Clear all parity and ecc error interrupts */
>  	writel_relaxed(~0U, host->axi + RZG3S_PCI_PEIS1);
> @@ -1435,16 +1509,21 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>  				 PCIE_LINK_WAIT_SLEEP_MS * MILLI,
>  				 PCIE_LINK_WAIT_SLEEP_MS * MILLI *
>  				 PCIE_LINK_WAIT_MAX_RETRIES);
> -	if (ret)
> -		goto config_deinit_post;
> +	if (ret) {
> +		/*
> +		 * Link is down. Leave the controller running so the
> +		 * DL_UpDown handler can enumerate a device that appears
> +		 * later.
> +		 */
> +		dev_info(host->dev, "PCIe link down, waiting for DL_UpDown\n");
> +		ret = -ENODEV;
> +	}
> 
>  	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>  	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
> 
> -	return 0;
> +	return ret;
> 
> -config_deinit_post:
> -	host->data->config_deinit(host);
>  config_deinit_and_refclk:
>  	clk_disable_unprepare(host->port.refclk);
>  config_deinit:
> @@ -1706,8 +1785,15 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
> 
>  	ret = rzg3s_pcie_host_init(host);
>  	if (ret) {
> -		dev_err_probe(dev, ret, "Failed to initialize the HW!\n");
> -		goto teardown_irqdomain;
> +		if (ret != -ENODEV) {
> +			dev_err_probe(dev, ret,
> +				      "Failed to initialize the HW!\n");
> +			goto teardown_irqdomain;
> +		}
> +
> +		/* Link is down: hotplug via DL_UpDown will recover. */
> +		WRITE_ONCE(host->hw_initialized, true);
> +		return 0;
>  	}
> 
>  	ret = rzg3s_pcie_set_max_link_speed(host);
> @@ -1716,6 +1802,8 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
> 
>  	msleep(PCIE_RESET_CONFIG_WAIT_MS);
> 
> +	WRITE_ONCE(host->hw_initialized, true);
> +
>  	return 0;
> 
>  teardown_irqdomain:
> @@ -1803,6 +1891,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>  		of_parse_phandle(np, "renesas,sysc", 0);
>  	struct rzg3s_pcie_host *host;
>  	struct rzg3s_sysc *sysc;
> +	const char *evt_name;
>  	int ret;
> 
>  	bridge = devm_pci_alloc_host_bridge(dev, sizeof(*host));
> @@ -1880,6 +1969,7 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>  		goto rpm_disable;
> 
>  	raw_spin_lock_init(&host->hw_lock);
> +	INIT_WORK(&host->link_work, rzg3s_pcie_link_work);
> 
>  	ret = rzg3s_pcie_host_setup(host, rzg3s_pcie_init_irqdomain,
>  				    rzg3s_pcie_teardown_irqdomain);
> @@ -1893,8 +1983,39 @@ static int rzg3s_pcie_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto host_probe_teardown;
> 
> +	/*
> +	 * Request the PCIe event IRQ at the end of probe to avoid
> +	 * spurious link-state events during controller setup and bus
> +	 * enumeration. From here on, DL_UpDown events trigger the link
> +	 * worker to (re)scan the bus.
> +	 */
> +	host->event_irq = platform_get_irq_byname(pdev, "pcie_evt");
> +	if (host->event_irq < 0) {
> +		ret = host->event_irq;
> +		goto pci_host_remove;
> +	}
> +
> +	evt_name = devm_kasprintf(dev, GFP_KERNEL, "%s-pcie-evt",
> +				  dev_name(dev));
> +	if (!evt_name) {
> +		ret = -ENOMEM;
> +		goto pci_host_remove;
> +	}
> +
> +	ret = request_irq(host->event_irq, rzg3s_pcie_event_irq, 0,
> +			  evt_name, host);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Failed to request pcie_evt IRQ\n");
> +		goto pci_host_remove;
> +	}
> +
>  	return 0;
> 
> +pci_host_remove:
> +	pci_lock_rescan_remove();
> +	pci_stop_root_bus(bridge->bus);
> +	pci_remove_root_bus(bridge->bus);
> +	pci_unlock_rescan_remove();
>  host_probe_teardown:
>  	rzg3s_pcie_teardown_irqdomain(host);
>  	host->data->config_deinit(host);
> @@ -1924,9 +2045,19 @@ static int rzg3s_pcie_suspend_noirq(struct device *dev)
>  	struct rzg3s_sysc *sysc = host->sysc;
>  	int ret;
> 
> +	/*
> +	 * Stop accepting DL_UpDown events, then drain any worker that may
> +	 * already be running, before tearing the controller down.
> +	 */
> +	WRITE_ONCE(host->hw_initialized, false);
> +	cancel_work_sync(&host->link_work);
> +
>  	ret = pm_runtime_put_sync(dev);
> -	if (ret)
> +	if (ret) {
> +		/* Suspend aborted; keep handling DL_UpDown events. */
> +		WRITE_ONCE(host->hw_initialized, true);
>  		return ret;
> +	}
> 
>  	clk_disable_unprepare(port->refclk);
> 
> @@ -1957,6 +2088,8 @@ config_reinit:
>  refclk_restore:
>  	clk_prepare_enable(port->refclk);
>  	pm_runtime_resume_and_get(dev);
> +	/* Controller is alive again; resume DL_UpDown handling. */
> +	WRITE_ONCE(host->hw_initialized, true);
>  	return ret;
>  }
> 
> --
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

