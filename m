Return-Path: <linux-renesas-soc+bounces-34058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KX7TBQwQMWoabAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:57:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A25D668D57C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:57:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34058-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C7763008C30
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 08:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CAE41B37D;
	Tue, 16 Jun 2026 08:57:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278F41C31C;
	Tue, 16 Jun 2026 08:57:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600265; cv=none; b=gBhIN897x7pv5Lck1CAyQh3eywDqd6rOXTqvxmqytVBpuL4SDYKXVVKuNxPJw/z/MVesKUqSWZypm6PEpX9d8b6rYmaRB6E0//zJOxtckozqzIP20h8WBEz+y/TxP5VGpSxkbhfkYQq+DcJbJDGKzE9MI1oOcxn35yumynp4ZRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600265; c=relaxed/simple;
	bh=Kd1FcGFHU4GjjZdj/NFv9P8h5hSAhqphNEAHcwPrcx4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M7G0PJ3Sn1K4qEfIzo5xIj6L1HR9mlFxlnG5d8anyrJ8g9rilUky7YzLQzAR4CLimP8P3sQxcV4P+glMhNHhffdE944FkRTzy+Pfi9/M6dEqjDCSshBbvA57Fxrl0sqJSFsUnnsxGcuJL9HLvpPg8EHzfE7of/5DBIH0flEbQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A47F51F000E9;
	Tue, 16 Jun 2026 08:57:41 +0000 (UTC)
Message-ID: <a6be40ce-975f-4c7f-a261-18a447e6aeca@tuxon.dev>
Date: Tue, 16 Jun 2026 11:57:39 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: renesas_usbhs: Fix power-off ordering on unbind
To: Biju <biju.das.au@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Fan Wu <fanwu01@zju.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260615173912.336408-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[tuxon.dev];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34058-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:gregkh@linuxfoundation.org,m:biju.das.jz@bp.renesas.com,m:claudiu.beznea.uj@bp.renesas.com,m:fanwu01@zju.edu.cn,m:vkoul@kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A25D668D57C

Hi, Biju,

On 6/15/26 20:39, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Move the usbhsc_power_ctrl() call to before usbhs_*_hardware_exit(), so
> that usbhs_*_hardware_exit() sets priv->phy to NULL only after
> usbhsc_power_ctrl() has executed, which controls the PHY power.
> 
> Fixes: eb9ac779830b ("usb: renesas_usbhs: Fix synchronous external abort on unbind")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>   drivers/usb/renesas_usbhs/common.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index 8c93bde4b816..614b724a0e52 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -813,6 +813,10 @@ static void usbhs_remove(struct platform_device *pdev)
>   
>   	flush_delayed_work(&priv->notify_hotplug_work);
>   
> +	/* power off */
> +	if (!usbhs_get_dparam(priv, runtime_pwctrl))
> +		usbhsc_power_ctrl(priv, 0);
> +

Moving this back here will lead to the issue described in commit eb9ac779830b 
("usb: renesas_usbhs: Fix synchronous external abort on unbind") being 
reproducible again. I've checked it on RZ/G2L.

Instead, the below diff fixes both the USB PHY regulator WARN_ON() stack trace 
and still keeps away the crash fixed by eb9ac779830b ("usb: renesas_usbhs: Fix 
synchronous external abort on unbind").

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..843468d42786 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,7 +813,6 @@ static void usbhs_remove(struct platform_device *pdev)

         flush_delayed_work(&priv->notify_hotplug_work);

-       usbhs_platform_call(priv, hardware_exit, pdev);
         reset_control_assert(priv->rsts);

         /*
@@ -832,6 +831,8 @@ static void usbhs_remove(struct platform_device *pdev)
         if (!usbhs_get_dparam(priv, runtime_pwctrl))
                 usbhsc_power_ctrl(priv, 0);

+       usbhs_platform_call(priv, hardware_exit, pdev);
+
         usbhsc_clk_put(priv);
         pm_runtime_disable(&pdev->dev);
  }

Along with it, the reset_control_assert() could also be moved as follows to 
avoid accessing registers IPs with the reset line asserted. The following was 
also tested on RZ/G2L:

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 8c93bde4b816..51d3035f82be 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -813,9 +813,6 @@ static void usbhs_remove(struct platform_device *pdev)

         flush_delayed_work(&priv->notify_hotplug_work);

-       usbhs_platform_call(priv, hardware_exit, pdev);
-       reset_control_assert(priv->rsts);
-
         /*
          * Explicitly free the IRQ to ensure the interrupt handler is
          * disabled and synchronized before freeing resources.
@@ -832,6 +829,9 @@ static void usbhs_remove(struct platform_device *pdev)
         if (!usbhs_get_dparam(priv, runtime_pwctrl))
                 usbhsc_power_ctrl(priv, 0);

+       usbhs_platform_call(priv, hardware_exit, pdev);
+       reset_control_assert(priv->rsts);
+
         usbhsc_clk_put(priv);
         pm_runtime_disable(&pdev->dev);
  }

Thank you,
Claudiu

