Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BF41CF5E9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 May 2020 15:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729921AbgELNgR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 May 2020 09:36:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35344 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729756AbgELNgQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 May 2020 09:36:16 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jYV4v-0003Rj-H3
        for linux-renesas-soc@vger.kernel.org; Tue, 12 May 2020 13:36:13 +0000
Received: by mail-pl1-f197.google.com with SMTP id be7so10048827plb.21
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 May 2020 06:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=3QbtWi3wsf1LF3UN0EWC9HG+YQXWbeigC60hrNmNJsg=;
        b=iKlAZGW+s4p0Cr2DOP4nF/TeIk43NZKgubXX7QdZA7gFCtKifZ0xKTAYIqgtt2Upy6
         6KST31oSH84AHjSzNhIQjoRcOA34sCEw/sqNo0zpTNUoNDPKvloHSdNP2budDOrExkla
         t27YpW5dqFn+nlPuPrs3cwxMnEl91dPuvBUF/DcTen+zFI+mqXXB661OcABZZWRezqnv
         fun7al9pTpxOboVECju+58aYnpT0V+V0+EnTjDJEL3VA/npQRtpBT5WrOiP7VIthrEPZ
         iP7xbkEkTM0O3ugd2KB+nuNDACNvPYbNIkbcNrwgZwsBaGZoSLLlsXuTRvqmA4Kyonpd
         LhSQ==
X-Gm-Message-State: AOAM531pwTPG6y3tvgJAm8YaTYvkQs8XU9855X+EdLaTtKb/2Z9WiDB4
        Jw9FdfxpjJEuCR0LdgoAx1kUfj0HLPXpO3ulvB+gZ3Z2P0PCVaCueTe8ngtSMsJcrdLjRRVAxxE
        GKc4geVy6WiFIi4lxbVQcFsfgKXO+t//9OdBDV/AC8K+hTpZv
X-Received: by 2002:a63:b506:: with SMTP id y6mr1985668pge.107.1589290571914;
        Tue, 12 May 2020 06:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqSJt84eMeBF6JbK0R0JQheIp555UBITFFPqlDRqD6lyOzpGOcD8KLjLO1LppGrr+FeRSA5w==
X-Received: by 2002:a63:b506:: with SMTP id y6mr1985644pge.107.1589290571570;
        Tue, 12 May 2020 06:36:11 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id a30sm10605469pgm.44.2020.05.12.06.36.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 May 2020 06:36:10 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v4] USB: hub: Fix the broken detection of USB3 device in
 SMSC hub
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
Date:   Tue, 12 May 2020 21:36:07 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stern@rowland.harvard.edu, thinhn@synopsys.com,
        Kento.A.Kobayashi@sony.com, atmgnd@outlook.com,
        linux-usb@vger.kernel.org, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <73933975-6F0E-40F5-9584-D2B8F615C0F3@canonical.com>
References: <1580989763-32291-1-git-send-email-hgajjar@de.adit-jv.com>
To:     Hardik Gajjar <hgajjar@de.adit-jv.com>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Hardik,

This patch prevents my Raven Ridge xHCI from getting runtime suspend.

> On Feb 6, 2020, at 19:49, Hardik Gajjar <hgajjar@de.adit-jv.com> wrote:
> 
> Renesas R-Car H3ULCB + Kingfisher Infotainment Board is either not able
> to detect the USB3.0 mass storage devices or is detecting those as
> USB2.0 high speed devices.
> 
> The explanation given by Renesas is that, due to a HW issue, the XHCI
> driver does not wake up after going to sleep on connecting a USB3.0
> device.

Since the issue is already root caused to xHCI, sounds the workaround should be implemented in xHCI?

Functions like xhci_alloc_dev() can be a better place to instrument the workaround.

Kai-Heng

> 
> In order to mitigate that, disable the auto-suspend feature
> specifically for SMSC hubs from hub_probe() function, as a quirk.
> 
> Renesas Kingfisher Infotainment Board has two USB3.0 ports (CN2) which
> are connected via USB5534B 4-port SuperSpeed/Hi-Speed, low-power,
> configurable hub controller.
> 
> [1] SanDisk USB 3.0 device detected as USB-2.0 before the patch
> [   74.036390] usb 5-1.1: new high-speed USB device number 4 using xhci-hcd
> [   74.061598] usb 5-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> [   74.069976] usb 5-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   74.077303] usb 5-1.1: Product: Ultra
> [   74.080980] usb 5-1.1: Manufacturer: SanDisk
> [   74.085263] usb 5-1.1: SerialNumber: 4C530001110208116550
> 
> [2] SanDisk USB 3.0 device detected as USB-3.0 after the patch
> [   34.565078] usb 6-1.1: new SuperSpeed Gen 1 USB device number 3 using xhci-hcd
> [   34.588719] usb 6-1.1: New USB device found, idVendor=0781, idProduct=5581, bcdDevice= 1.00
> [   34.597098] usb 6-1.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   34.604430] usb 6-1.1: Product: Ultra
> [   34.608110] usb 6-1.1: Manufacturer: SanDisk
> [   34.612397] usb 6-1.1: SerialNumber: 4C530001110208116550
> 
> Suggested-by: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Hardik Gajjar <hgajjar@de.adit-jv.com>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> ---
> Changes in v4:
> - [Eugeniu Rosca] Corrected indentation in hub.h
> 
> Changes in v3:
> - [Alan Stern] Called usb_autopm_put_interface() from
>   hub_disconnect() to enable auto suspend for interface.
> - [v3] https://lore.kernel.org/linux-renesas-soc/1580838253-31822-1-git-send-email-hgajjar@de.adit-jv.com/
> 
> Changes in v2:
> - [Alan Stern] Switched from pm_runtime_set_autosuspend_delay()
>   to usb_autopm_get_interface()
> - Improved commit description
> - Rebased against v5.5
> - [v2] https://lore.kernel.org/linux-renesas-soc/1580403994-21076-1-git-send-email-hgajjar@de.adit-jv.com/
> 
> drivers/usb/core/hub.c | 15 +++++++++++++++
> drivers/usb/core/hub.h |  1 +
> 2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3405b14..de94fa4 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -38,7 +38,9 @@
> #include "otg_whitelist.h"
> 
> #define USB_VENDOR_GENESYS_LOGIC		0x05e3
> +#define USB_VENDOR_SMSC				0x0424
> #define HUB_QUIRK_CHECK_PORT_AUTOSUSPEND	0x01
> +#define HUB_QUIRK_DISABLE_AUTOSUSPEND		0x02
> 
> #define USB_TP_TRANSMISSION_DELAY	40	/* ns */
> #define USB_TP_TRANSMISSION_DELAY_MAX	65535	/* ns */
> @@ -1731,6 +1733,10 @@ static void hub_disconnect(struct usb_interface *intf)
> 	kfree(hub->buffer);
> 
> 	pm_suspend_ignore_children(&intf->dev, false);
> +
> +	if (hub->quirk_disable_autosuspend)
> +		usb_autopm_put_interface(intf);
> +
> 	kref_put(&hub->kref, hub_release);
> }
> 
> @@ -1863,6 +1869,11 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
> 	if (id->driver_info & HUB_QUIRK_CHECK_PORT_AUTOSUSPEND)
> 		hub->quirk_check_port_auto_suspend = 1;
> 
> +	if (id->driver_info & HUB_QUIRK_DISABLE_AUTOSUSPEND) {
> +		hub->quirk_disable_autosuspend = 1;
> +		usb_autopm_get_interface(intf);
> +	}
> +
> 	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0)
> 		return 0;
> 
> @@ -5599,6 +5610,10 @@ static void hub_event(struct work_struct *work)
> }
> 
> static const struct usb_device_id hub_id_table[] = {
> +    { .match_flags = USB_DEVICE_ID_MATCH_VENDOR | USB_DEVICE_ID_MATCH_INT_CLASS,
> +      .idVendor = USB_VENDOR_SMSC,
> +      .bInterfaceClass = USB_CLASS_HUB,
> +      .driver_info = HUB_QUIRK_DISABLE_AUTOSUSPEND},
>     { .match_flags = USB_DEVICE_ID_MATCH_VENDOR
> 			| USB_DEVICE_ID_MATCH_INT_CLASS,
>       .idVendor = USB_VENDOR_GENESYS_LOGIC,
> diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
> index a9e24e4..a97dd1b 100644
> --- a/drivers/usb/core/hub.h
> +++ b/drivers/usb/core/hub.h
> @@ -61,6 +61,7 @@ struct usb_hub {
> 	unsigned		quiescing:1;
> 	unsigned		disconnected:1;
> 	unsigned		in_reset:1;
> +	unsigned		quirk_disable_autosuspend:1;
> 
> 	unsigned		quirk_check_port_auto_suspend:1;
> 
> -- 
> 2.7.4
> 
> 

