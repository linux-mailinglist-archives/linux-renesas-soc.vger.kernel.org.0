Return-Path: <linux-renesas-soc+bounces-34543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QFbzNlvuQmpGIwoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:14:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2620A6DF027
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 00:14:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="O/vQFahF";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF1DA3004630
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 22:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9D13101A7;
	Mon, 29 Jun 2026 22:14:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18D287268
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 22:14:46 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771288; cv=pass; b=YQgpKk7ZN6GuAePnnnxGF40DfP5pPC0TGwH468YQmh1dU/d3O/p5bb7DHuR5xqfVx5JPRoMYI6yM209asTQPYsnsWmXiWwDBL433b/65PjHPUYdoVrgb3BePzYosSq+/ShjiniUbVgu/IeRvrIM0Nao0CxLyKjd/8C/FVakFyoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771288; c=relaxed/simple;
	bh=tNvS4wghLkR96YsPte35jchdPfnLW5rRrRAxwT1/quM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8WWFdFAffT8MKQ6s0W/HHd8DTWqw3LeOgt2qbd2uG0NBoEdceZohiLQG+uIxqDkyRikL9tYTz7i/wYiD1L8tV/wG9Y+zRGEj0G0sPJ1hKq7ZebQmgrMvw5QVr521VEhUCVpUd3XSCRN19f5RcPy+y+iyrcw8YZX6dsibUpF+9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/vQFahF; arc=pass smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4758bd3731bso9644f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 15:14:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782771285; cv=none;
        d=google.com; s=arc-20260327;
        b=Wo+2bQFNYwoRvLTSzSMR3+QDyN/woY4oEDUQBdorrA1suvtRsGHvWatpdYpU+3OYgD
         HXd3WWOoUleqYj4NmhiLwA2p7BoD/UlYSD1BdyGmpJuwHE+KoPfyUu0UAw6onqyoPZW/
         OrthGRcnRD4PTZKIhOdUD6x1q58of0G25OXWFYVkc5NmUxD8xB70d8MjDqVyS4UIm3zZ
         mYwPb+MKmoBriiyVYdo3dWihOz3CHixtr+RhEQg/TymQlIjM7/05hlWOCjfcBY6jonOS
         K1Nvs2LlsvkQbia5NpqnWba1GlH2gF3IMb9cjw3y7bgMTDfC3cGtJHdqZmy6AEJDBYHn
         Sfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DOmPUxVNWzft3lpJ4savxUgwWUsm8gSvOvyvp3FlK78=;
        fh=YbwUu8gbQQaH7lClGqj/qhHQRUlw+vXiEPBTxUfSxY4=;
        b=eoYsD//ZaxhyqeLwdDYvRH4I4tTRhndJA9DkZ64a06df0OF2O4R2x9kJQuKraW7sHj
         1mMwec6Z52w/Yjl5JAsRrPOcpI22J/QpAnraB60KrEe4uSoQ2oFx7hYoxFLjxoC8GiJm
         KydkSee8G3FqpPLTK/JRYMb8OnfxgzgnnSzUPWl7150732DHZ6CvqYtmcC6VHSRPczdy
         dR2hL+2hoJRNe3Jogu+T1wJVt3wPAxa94R0p9iKt5TGUs47br0KDEO3oSKuIGlySJhCW
         /wnKXcna83rzwPEBrbfJH1PE2n7sHitnvFY2U2pFr7xluapd/v6op8t6j82zmWLB52rP
         rDvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782771285; x=1783376085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOmPUxVNWzft3lpJ4savxUgwWUsm8gSvOvyvp3FlK78=;
        b=O/vQFahF7aiKXQAUC8B2ZHVjQfpnmutnKfkvfNR/MMLtiGls4LZ5M42KtTjJtJiBgL
         34Au+vFjB8RhK86DghmNjN5GRgqKzKOaev2y9cjEtGlP1HK5mdyNkcCJvcvOI191Qz6Q
         wojaNAotYqRTgGogU5r2N3Ywq0BpNLdJDMzFxyxh1qnZbtHbCTBgwlt+K83rkZGj6n6m
         z6qlIO5/40ImrZUI/B93Q7d8im955IVmyGCwxSDljjRTLSFcxwMQFJNwovQZsqmvcfsc
         MjJaNqKY6nuQDPTHFll6NI5Rtrk57Sw629tabCsCa0l5OK0TJTbruUGSc8OLkcnfBTn5
         l0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782771285; x=1783376085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOmPUxVNWzft3lpJ4savxUgwWUsm8gSvOvyvp3FlK78=;
        b=KwvCHaozjsJn+OcWhW7ITLhF9VTCAyJXSH7ULJUrZUbiHJ3RHwWROsR8tgAW7BReKz
         2IcdP0zASxnV7LZwHeZ51YbaLKBdxmA8qw5xFpetSMHslgN1PqDX800lCtFMeTQIaDmt
         Q0KjrRV+cthQBb7QsVJPC/Uar+A6pVW5xD84l0qMtVE65ldDQlHKJ2OEoQk7hRSfvGAV
         MwIibAwF01Bi3T1NveSOB/WyhYv5kRwnDRjALWRkOFKjdAW/zgWJeKC5dinK6B1F94lc
         xTj898IxiCzyMsATxwKbuhhkyb/ulNKCrgyyU94E8gLGQSAD9Y+vJaZWA6NY6S/ADIhd
         bEBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp7xFjE8G8LaPsPD9zw54Cs/xW9vTkHKe8d3v0lmg8D6rGgwYI8NM3akbsLLp8acXmzlC3TyAJs6AA5eATTYEo6ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvnQTW7LsRdsJrjfxWxuA7kg/CmEqUIbJQvtGAa/ux/MXcfeRP
	tyo/vyIVJIL0Q9JXTs2SJkowKLugRXduyvW3FKQg6FVXG2Ik6LncybaYsWnIJDfCf2SLQ8fjsRP
	LNQHS9BwWtCNrCtGBiDSyLRt54qMSBCU=
X-Gm-Gg: AfdE7cndHxEl2E7TKlUkWztSgelHqYxuJhUt2xrJGAWCJGWUxE3WDxxmMwi1fo48UWY
	N1hMrKrfrLEXJsuc6uZGW+PA96dCFyzUW2EGJkcDJROTcQ7XiMRgEtkTEhAmn+C+B88iK/UGYYP
	J66nIYe7vhSM6VjsjVcf1Rt95TIxh2dvoYhlGdR5PTcEd6S5Xlx4dY530ljUI4kzuutz9rvj1vc
	gFKZ3EdF5Qo0kIjpn/b+aABhaJ0Yi1BGjZRS/ysEJ/7rTCC2NqvVkW3Lu4n4PHOwKdQQbHWkMxr
	wRTgnHSqyLfWaIltcv4fnoa33+0Ax1foYmINwwXvTCgY7oK6OXvLrH0e4Tceg2MNgtJgivA/eCS
	dJoUpTnxKPiNu/DJSwTMyHJja6w==
X-Received: by 2002:a05:6000:2913:b0:461:a15f:7aa5 with SMTP id
 ffacd0b85a97d-4754c0d809amr1345932f8f.21.1782771285182; Mon, 29 Jun 2026
 15:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618190935.3018531-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260618190935.3018531-1-john.madieu.xa@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 29 Jun 2026 23:14:19 +0100
X-Gm-Features: AVVi8CdaMSXeyogdv3RhR5uRIo8Wq3v2AVlnVJFCp8Ln9yJUGKp95yjP6ekEIOw
Message-ID: <CA+V-a8tCcGtV9Fiz8ByZ+-EXJjyR0+S_g3HnVabtPSx5_s1q4w@mail.gmail.com>
Subject: Re: [PATCH] PCI: rzg3s-host: Re-enumerate the bus on PCIe link-state changes
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, bhelgaas@google.com, robh@kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, john.madieu@gmail.com, 
	biju.das.jz@bp.renesas.com, geert+renesas@glider.be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34543-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:robh@kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:biju.das.jz@bp.renesas.com,m:geert+renesas@glider.be,m:johnmadieu@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,vger.kernel.org,gmail.com,glider.be];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2620A6DF027

Hi John,

Thank you for the patch.

On Thu, Jun 18, 2026 at 8:10=E2=80=AFPM John Madieu
<john.madieu.xa@bp.renesas.com> wrote:
>
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
> resume, is acknowledged but does not schedule a rescan. The
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
>  drivers/pci/controller/pcie-rzg3s-host.c | 153 +++++++++++++++++++++--
>  1 file changed, 143 insertions(+), 10 deletions(-)
>
There are patches already inflight for this driver [0] (which should
be the last series). This patch doesn't apply on top of it. Please
rebase on top of this series and send a v2 mentioning the dependency.

[0] https://lore.kernel.org/all/20260629220932.861445-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

Cheers,
Prabhakar

> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/contr=
oller/pcie-rzg3s-host.c
> index d86e7516dcc2..5a10422ced2e 100644
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
> @@ -294,7 +295,12 @@ struct rzg3s_pcie_port {
>   * @msi: MSI data structure
>   * @port: PCIe Root Port
>   * @hw_lock: lock for access to the HW resources
> + * @link_work: work for DL_UpDown link-state change handling
> + * @event_irq: PCIe event interrupt for DL_UpDown detection
>   * @intx_irqs: INTx interrupts
> + * @hw_initialized: set once the controller HW is fully initialised; gat=
es
> + *                  DL_UpDown event handling against events latched whil=
e
> + *                  the registers are not configured
>   * @max_link_speed: maximum supported link speed
>   */
>  struct rzg3s_pcie_host {
> @@ -309,7 +315,10 @@ struct rzg3s_pcie_host {
>         struct rzg3s_pcie_msi msi;
>         struct rzg3s_pcie_port port;
>         raw_spinlock_t hw_lock;
> +       struct work_struct link_work;
> +       int event_irq;
>         int intx_irqs[PCI_NUM_INTX];
> +       bool hw_initialized;
>         int max_link_speed;
>  };
>
> @@ -575,6 +584,30 @@ static irqreturn_t rzg3s_pcie_msi_irq(int irq, void =
*data)
>         return IRQ_HANDLED;
>  }
>
> +static irqreturn_t rzg3s_pcie_event_irq(int irq, void *data)
> +{
> +       struct rzg3s_pcie_host *host =3D data;
> +       u32 status;
> +
> +       status =3D readl_relaxed(host->axi + RZG3S_PCI_PEIS0);
> +
> +       if (!(status & RZG3S_PCI_PEIS0_DL_UPDOWN))
> +               return IRQ_NONE;
> +
> +       /* Clear the DL_UpDown status (W1C) */
> +       writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_P=
EIS0);
> +
> +       /*
> +        * Drop the event until the controller is fully initialised. The
> +        * event IRQ may act as a system wakeup source and fire during
> +        * resume before the HW registers have been reconfigured.
> +        */
> +       if (READ_ONCE(host->hw_initialized))
> +               schedule_work(&host->link_work);
> +
> +       return IRQ_HANDLED;
> +}
> +
>  static void rzg3s_pcie_msi_irq_ack(struct irq_data *d)
>  {
>         struct rzg3s_pcie_msi *msi =3D irq_data_get_irq_chip_data(d);
> @@ -1107,6 +1140,47 @@ static int rzg3s_pcie_set_max_link_speed(struct rz=
g3s_pcie_host *host)
>         return ret;
>  }
>
> +static void rzg3s_pcie_link_work(struct work_struct *work)
> +{
> +       struct rzg3s_pcie_host *host =3D
> +               container_of(work, struct rzg3s_pcie_host, link_work);
> +       struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host=
);
> +       struct pci_bus *bus =3D bridge->bus;
> +       u32 val;
> +
> +       val =3D readl_relaxed(host->axi + RZG3S_PCI_PCSTAT1);
> +       if (val & RZG3S_PCI_PCSTAT1_DL_DOWN_STS) {
> +               struct pci_dev *dev, *tmp;
> +
> +               dev_info(host->dev, "PCIe link down, removing devices\n")=
;
> +
> +               pci_lock_rescan_remove();
> +               list_for_each_entry_safe_reverse(dev, tmp,
> +                                                &bus->devices, bus_list)
> +                       pci_stop_and_remove_bus_device(dev);
> +               pci_unlock_rescan_remove();
> +       } else {
> +               int ret;
> +
> +               dev_info(host->dev, "PCIe link up, rescanning bus\n");
> +
> +               /*
> +                * Attempt link speed negotiation now that the link is up=
.
> +                * Failure is non-fatal: the device works at the negotiat=
ed
> +                * speed.
> +                */
> +               ret =3D rzg3s_pcie_set_max_link_speed(host);
> +               if (ret)
> +                       dev_info(host->dev, "Failed to set max link speed=
\n");
> +
> +               msleep(PCIE_RESET_CONFIG_WAIT_MS);
> +
> +               pci_lock_rescan_remove();
> +               pci_rescan_bus(bus);
> +               pci_unlock_rescan_remove();
> +       }
> +}
> +
>  static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
>  {
>         struct pci_host_bridge *bridge =3D pci_host_bridge_from_priv(host=
);
> @@ -1217,8 +1291,8 @@ static void rzg3s_pcie_irq_init(struct rzg3s_pcie_h=
ost *host)
>                        RZG3S_PCI_PEIS0_RX_DLLP_PM_ENTER,
>                        host->axi + RZG3S_PCI_PEIS0);
>
> -       /* Disable all interrupts */
> -       writel_relaxed(0, host->axi + RZG3S_PCI_PEIE0);
> +       /* Enable DL_UpDown interrupt for link state change detection */
> +       writel_relaxed(RZG3S_PCI_PEIS0_DL_UPDOWN, host->axi + RZG3S_PCI_P=
EIE0);
>
>         /* Clear all parity and ecc error interrupts */
>         writel_relaxed(~0U, host->axi + RZG3S_PCI_PEIS1);
> @@ -1384,16 +1458,21 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie=
_host *host)
>                                  PCIE_LINK_WAIT_SLEEP_MS * MILLI,
>                                  PCIE_LINK_WAIT_SLEEP_MS * MILLI *
>                                  PCIE_LINK_WAIT_MAX_RETRIES);
> -       if (ret)
> -               goto config_deinit_post;
> +       if (ret) {
> +               /*
> +                * Link is down. Leave the controller running so the
> +                * DL_UpDown handler can enumerate a device that appears
> +                * later.
> +                */
> +               dev_info(host->dev, "PCIe link down, waiting for DL_UpDow=
n\n");
> +               ret =3D -ENODEV;
> +       }
>
>         val =3D readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>         dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>
> -       return 0;
> +       return ret;
>
> -config_deinit_post:
> -       host->data->config_deinit(host);
>  config_deinit_and_refclk:
>         clk_disable_unprepare(host->port.refclk);
>  config_deinit:
> @@ -1655,8 +1734,15 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host=
,
>
>         ret =3D rzg3s_pcie_host_init(host);
>         if (ret) {
> -               dev_err_probe(dev, ret, "Failed to initialize the HW!\n")=
;
> -               goto teardown_irqdomain;
> +               if (ret !=3D -ENODEV) {
> +                       dev_err_probe(dev, ret,
> +                                     "Failed to initialize the HW!\n");
> +                       goto teardown_irqdomain;
> +               }
> +
> +               /* Link is down: hotplug via DL_UpDown will recover. */
> +               WRITE_ONCE(host->hw_initialized, true);
> +               return 0;
>         }
>
>         ret =3D rzg3s_pcie_set_max_link_speed(host);
> @@ -1665,6 +1751,8 @@ rzg3s_pcie_host_setup(struct rzg3s_pcie_host *host,
>
>         msleep(PCIE_RESET_CONFIG_WAIT_MS);
>
> +       WRITE_ONCE(host->hw_initialized, true);
> +
>         return 0;
>
>  teardown_irqdomain:
> @@ -1682,6 +1770,7 @@ static int rzg3s_pcie_probe(struct platform_device =
*pdev)
>                 of_parse_phandle(np, "renesas,sysc", 0);
>         struct rzg3s_pcie_host *host;
>         struct rzg3s_sysc *sysc;
> +       const char *evt_name;
>         int ret;
>
>         bridge =3D devm_pci_alloc_host_bridge(dev, sizeof(*host));
> @@ -1745,6 +1834,7 @@ static int rzg3s_pcie_probe(struct platform_device =
*pdev)
>                 goto rpm_disable;
>
>         raw_spin_lock_init(&host->hw_lock);
> +       INIT_WORK(&host->link_work, rzg3s_pcie_link_work);
>
>         ret =3D rzg3s_pcie_host_setup(host, rzg3s_pcie_init_irqdomain,
>                                     rzg3s_pcie_teardown_irqdomain);
> @@ -1758,8 +1848,39 @@ static int rzg3s_pcie_probe(struct platform_device=
 *pdev)
>         if (ret)
>                 goto host_probe_teardown;
>
> +       /*
> +        * Request the PCIe event IRQ at the end of probe to avoid
> +        * spurious link-state events during controller setup and bus
> +        * enumeration. From here on, DL_UpDown events trigger the link
> +        * worker to (re)scan the bus.
> +        */
> +       host->event_irq =3D platform_get_irq_byname(pdev, "pcie_evt");
> +       if (host->event_irq < 0) {
> +               ret =3D host->event_irq;
> +               goto pci_host_remove;
> +       }
> +
> +       evt_name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-pcie-evt",
> +                                 dev_name(dev));
> +       if (!evt_name) {
> +               ret =3D -ENOMEM;
> +               goto pci_host_remove;
> +       }
> +
> +       ret =3D request_irq(host->event_irq, rzg3s_pcie_event_irq, 0,
> +                         evt_name, host);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to request pcie_evt IRQ\n=
");
> +               goto pci_host_remove;
> +       }
> +
>         return 0;
>
> +pci_host_remove:
> +       pci_lock_rescan_remove();
> +       pci_stop_root_bus(bridge->bus);
> +       pci_remove_root_bus(bridge->bus);
> +       pci_unlock_rescan_remove();
>  host_probe_teardown:
>         rzg3s_pcie_teardown_irqdomain(host);
>         host->data->config_deinit(host);
> @@ -1789,9 +1910,19 @@ static int rzg3s_pcie_suspend_noirq(struct device =
*dev)
>         struct rzg3s_sysc *sysc =3D host->sysc;
>         int ret;
>
> +       /*
> +        * Stop accepting DL_UpDown events, then drain any worker that ma=
y
> +        * already be running, before tearing the controller down.
> +        */
> +       WRITE_ONCE(host->hw_initialized, false);
> +       cancel_work_sync(&host->link_work);
> +
>         ret =3D pm_runtime_put_sync(dev);
> -       if (ret)
> +       if (ret) {
> +               /* Suspend aborted; keep handling DL_UpDown events. */
> +               WRITE_ONCE(host->hw_initialized, true);
>                 return ret;
> +       }
>
>         clk_disable_unprepare(port->refclk);
>
> @@ -1822,6 +1953,8 @@ static int rzg3s_pcie_suspend_noirq(struct device *=
dev)
>  refclk_restore:
>         clk_prepare_enable(port->refclk);
>         pm_runtime_resume_and_get(dev);
> +       /* Controller is alive again; resume DL_UpDown handling. */
> +       WRITE_ONCE(host->hw_initialized, true);
>         return ret;
>  }
>
> --
> 2.25.1
>
>

