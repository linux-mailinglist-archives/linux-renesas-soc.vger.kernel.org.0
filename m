Return-Path: <linux-renesas-soc+bounces-16127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFE1A922BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:33:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0371319E59F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 16:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D028F6B;
	Thu, 17 Apr 2025 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOBBICY7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B162DFA36;
	Thu, 17 Apr 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744907585; cv=none; b=KeJ9LCo7KHxZFlBXcCVw+1R3r+2emql2agIEVvzLzAaTtj+ZrwcJebwoQf23N7FKxFLvwhFMFAMuLefWQUouWz0kAi8dqPdzS2XMQZv57Nz43uk6WSgXLIMLsepaDbjkIwB1R8So1/9S2+sY0hyaJVOgkdSaedYsEXMZEjfaotg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744907585; c=relaxed/simple;
	bh=+w2qAZcn2CKgWbNRP8OjCu+/hvIoWDvL63CxhDetbDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hNzposni8/bn5r0HqYQK6CKUT9kDreQcRKSqM8XDYZLz8dEmap7+gEq9VchRrEtb9eMiRF2/4lipLiQcbM9uC/QkRA46tk+lTfqcN3MxX+ZFU9KikJtPIIYfNSVbydHQCgqTKVDT7zxgL3m7Qs8ODW6YlB7kAW4CK3H3f8J/gJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOBBICY7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efc457bso601497f8f.2;
        Thu, 17 Apr 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744907582; x=1745512382; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d27NbA4nb6yCXEbGtzpzJQXBMSVEBc1NZTOKaRr5mOs=;
        b=LOBBICY7iRF9Z/gZLOMkqNzIph8vVfiXmMiEFrvf/46xaXw5jzk1mR02gDsxmDHZDF
         sDROVrtLE24SPB5/yZLOap5xVr1v/S3knZh0gJXM3y9Dm7brVEUwm1178kmnlciKLy7J
         w+Z8kBo4n5+fM+MQGof2A2eR28x3vM9cP2eKveAOxAsN4+hJ1oyplGrJ5i4uSncOztzn
         GZ/P+TmfZhIz8DHgEUQC+eKb79E518hLObobZkxfYVrFek2nVJciFtW9iFI2+xS+0kgI
         bzUwZVx6T/iIZ8dfkzzKKIvjLdPH9aBNLR62W223wvECazXKZrkB8EhFvtsv9Nq2cNPW
         57ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744907582; x=1745512382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d27NbA4nb6yCXEbGtzpzJQXBMSVEBc1NZTOKaRr5mOs=;
        b=ezubiWjAt/giGPf6Lfm8vPLXJjPQVe3AOp35NWrhE+N+cxcZLklmWJCAkX+SBkUT+j
         JMuPcklENHSgRbYh166jwXCSczQhsazYp4BHE8CA3HfLtaJQSVPpe+U5Mli5RS0jgfwq
         +gVpw/ynhOWruE62CgRHqA+nxjC0vN8ZbfL9YoJTV3bDsRYAHej39OZS+WlPsMPOaPft
         fnuUHsNUaqaW6Sqf3jPEDQltiokxb7XQflzjvYhNu5+dU5jlH2ibU7h5WA1L/y9fQSHH
         VGYCD0BqMB5yXeh4P29A6zYWdFTT5HRdzksf4ecTP9ElW3FyP+CJeo5L+wC2EziyjGBI
         zCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6NFHU3sTM4jQIxTuS4P/M5MhjFMfCdN5b3R/dtDaolKP5QtSdDnZkywhXBzI5lYKgn13kv97Bt+tuWcQ=@vger.kernel.org, AJvYcCWQPvSpLryEOOe9G9duzYTqPWiOfdiycu4SlrRycwnu2ATweAKOPUvfeBvQeKLHKTSV+F2XoL6gfmOZXE/92FScRlQ=@vger.kernel.org, AJvYcCXegbKuADiNr6E9y8P/mrSLvcLoaQ/sA3SP0hd14fhBdc0Q80VBdJ+xP94WHI/Go4Ahu+GgyGzMP8BP@vger.kernel.org
X-Gm-Message-State: AOJu0YwlgRUhmseK2QMIkFwi5qG1S2rOaKjtfCJA7aOjGomUUmQzXHkC
	q9nb1uIbAU2TApAAR3Wm9zc+ip4lUwbmB66z7oqKwypbEmQZIU0+zw+sD3MRWoxGMt1ErOrv/nR
	MorpgDYBFfMM6uxONA7gc9+ueKuc=
X-Gm-Gg: ASbGncv75BY+MxEJsJKLOLBD3jlxUnKnQZCIPmVCWBJze1W7KdEQ3P9a3LWW3ydSUR/
	UbOsgMkIpb5nP++rUHnFLPkREKMWX8kL7/4eo7i1A5U2FsmqQcoOs1HHA4GVVl2bP/0wKrFsBgB
	bnIzrbI1YAhJtjFHmsCAy9dyofWlsS5kD9sj05Rgs/oFoiPMWjbkTI7A==
X-Google-Smtp-Source: AGHT+IGFWAWcSO5kTGEPdBFt1Nd1NH+T9T2mZyf0A4Ha04YrnXW3f4oz/2xv6XwK3kwbQVF7nTJOMDpWYZAU09E775o=
X-Received: by 2002:a5d:584b:0:b0:39e:cc10:3945 with SMTP id
 ffacd0b85a97d-39ee5b13104mr5940692f8f.2.1744907581617; Thu, 17 Apr 2025
 09:33:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <CAMuHMdWXid=9NXUULSA-vedZyjvDKJWt2KX8_Y=arMOp_-gFRQ@mail.gmail.com>
 <TYCPR01MB110407080D95D7EE14CFDC5A5D8B42@TYCPR01MB11040.jpnprd01.prod.outlook.com>
 <TYCPR01MB1104086085A1B051D61AE104AD8B72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1104086085A1B051D61AE104AD8B72@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 17 Apr 2025 17:32:35 +0100
X-Gm-Features: ATxdqUGcNzZM5TerpdHc3B5_X6d1JvmKhGmPtrRYB8OcT-Lpo20kYaQiDb6GIiQ
Message-ID: <CA+V-a8uUNV_8R+4O+Rie86g4kRRG6rduKZD+F51PRavq7kzsFw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

Sorry for the delayed response.

On Thu, Apr 10, 2025 at 3:48=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hello Geert-san,
>
> > From: Yoshihiro Shimoda, Sent: Wednesday, April 9, 2025 10:10 AM
> > To: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Prabhakar <prabhakar.csengg@gmail.com>; Greg Kroah-Hartman <gregkh@=
linuxfoundation.org>; Kuninori Morimoto
> > <kuninori.morimoto.gx@renesas.com>; linux-usb@vger.kernel.org; linux-ke=
rnel@vger.kernel.org;
> > linux-renesas-soc@vger.kernel.org; Biju Das <biju.das.jz@bp.renesas.com=
>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; Fabrizio Castro <fabrizio.castro.jz=
@renesas.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: RE: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling =
and power management in probe
> >
> > Hello Geert-san,
> >
> > > From: Geert Uytterhoeven, Sent: Wednesday, April 9, 2025 12:43 AM
> > >
> > > Hi Shimoda-san,
> > >
> > > On Tue, 8 Apr 2025 at 12:40, Yoshihiro Shimoda
> > > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > > > From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
> > > > >
> > > > > Reorder the initialization sequence in `usbhs_probe()` to enable =
runtime
> > > > > PM before accessing registers, preventing potential crashes due t=
o
> > > > > uninitialized clocks.
> > > >
> > > > Just for a record. I don't know why, but the issue didn't occur on =
the original code
> > > > with my environment (R-Car H3). But, anyway, I understood that we n=
eed this patch for RZ/V2H.
> > >
> > > On R-Car Gen3 and later, the firmware must trap the external abort,
> > > as usually no crash happens, but register reads return zero when
> > > the module clock is turned off.  I am wondering why RZ/V2H behaves
> > > differently than R-Car Gen3?
> >
> > I'm guessing that:
> > - EHCI/OHCI drivers on R-Car Gen3 enabled both the USB clocks (EHCI/OHC=
I and USBHS).
> > - RZ/V2H didn't enable the USBHS clock only.
> >
> > So, I'm also guessing that the R-Car V2H issue can be reproduced if we =
disable EHCI/OHCI on R-Car Gen3.
> > # However, for some reasons, I don't have time to test for it today. (I=
'll test it tomorrow or later.)
>
> I tested this topic, and I realized that my guess was incorrect.
> In other words, the current code seems no problem except accessing regist=
er offset 0.
As Geert mentioned, we don't get synchronous aborts on R-Car Gen3--we
only get a 0 for register reads when the clock is not enabled, as seen
in the test you ran. On the RZ/V2H, however, if we try to access an IP
before enabling the clocks, error interrupts are triggered, which is
why we're seeing synchronous aborts.

I reverted the patch and made the changes shown below. As you can see,
two read and two write operations are triggered before the clock is
enabled. Since I return early when the clock is not enabled, I didn=E2=80=
=99t
encounter any synchronous aborts. However, once I removed this check,
I hit the synchronous abort on the RZ/V2H. Hence, the need for this
patch to enable the clock early in the probe.

----------------------
[   11.799862] g_serial gadget.0: Gadget Serial v2.4
[   11.804323] videodev: Linux video capture interface: v2.00
[   11.808019] g_serial gadget.0: g_serial ready
[   11.818591] renesas_usbhs 15820000.usb: usbhs_read: reg =3D 0
[   11.824173] renesas_usbhs 15820000.usb: usbhs_write: reg =3D 0
[   11.830178] [drm] Initialized panfrost 1.3.0 for 14850000.gpu on minor 0
[   11.841619] renesas_usbhs 15820000.usb: gadget probed
[   11.847552] renesas_usbhs 15820000.usb: usbhs_probe:714
[   11.852923] renesas_usbhs 15820000.usb: usbhs_probe:722
[   11.858214] renesas_usbhs 15820000.usb: usbhs_probe:726
[   11.863478] renesas_usbhs 15820000.usb: usbhs_read: reg =3D 0
[   11.869139] renesas_usbhs 15820000.usb: usbhs_write: reg =3D 0
[   11.874831] renesas_usbhs 15820000.usb: usbhs_probe:733
[   11.880081] renesas_usbhs 15820000.usb: usbhs_probe:744
[   11.885502] renesas_usbhs 15820000.usb: usbhs_probe:758
[   11.890782] renesas_usbhs 15820000.usb: usbhs_probe:762
[   11.896222] renesas_usbhs 15820000.usb: probed
----------------------


diff --git a/drivers/usb/renesas_usbhs/common.c
b/drivers/usb/renesas_usbhs/common.c
index 703cf5d0cb41..8893d02ae4b4 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -55,16 +55,26 @@
         !((priv)->pfunc->func) ? 0 :           \
         (priv)->pfunc->func(args))

+static bool clock_enabled =3D false;
+
 /*
  *             common functions
  */
 u16 usbhs_read(struct usbhs_priv *priv, u32 reg)
 {
+       if (!clock_enabled) {
+               dev_info(&priv->pdev->dev, "%s: reg =3D %x\n", __func__, re=
g);
+               return 0;
+       }
        return ioread16(priv->base + reg);
 }

 void usbhs_write(struct usbhs_priv *priv, u32 reg, u16 data)
 {
+       if (!clock_enabled) {
+               dev_info(&priv->pdev->dev, "%s: reg =3D %x\n", __func__, re=
g);
+               return;
+       }
        iowrite16(data, priv->base + reg);
 }

@@ -685,19 +695,23 @@ static int usbhs_probe(struct platform_device *pdev)
        INIT_DELAYED_WORK(&priv->notify_hotplug_work, usbhsc_notify_hotplug=
);
        spin_lock_init(usbhs_priv_to_lock(priv));

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /* call pipe and module init */
        ret =3D usbhs_pipe_probe(priv);
        if (ret < 0)
                return ret;

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        ret =3D usbhs_fifo_probe(priv);
        if (ret < 0)
                goto probe_end_pipe_exit;

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        ret =3D usbhs_mod_probe(priv);
        if (ret < 0)
                goto probe_end_fifo_exit;

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /* platform_set_drvdata() should be called after usbhs_mod_probe() =
*/
        platform_set_drvdata(pdev, priv);

@@ -705,16 +719,18 @@ static int usbhs_probe(struct platform_device *pdev)
        if (ret)
                goto probe_fail_rst;

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        ret =3D usbhsc_clk_get(dev, priv);
        if (ret)
                goto probe_fail_clks;
-
+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /*
         * device reset here because
         * USB device might be used in boot loader.
         */
        usbhs_sys_clock_ctrl(priv, 0);

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /* check GPIO determining if USB function should be enabled */
        if (gpiod) {
                ret =3D !gpiod_get_value(gpiod);
@@ -725,6 +741,7 @@ static int usbhs_probe(struct platform_device *pdev)
                }
        }

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /*
         * platform call
         *
@@ -738,11 +755,14 @@ static int usbhs_probe(struct platform_device *pdev)
                goto probe_end_mod_exit;
        }

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /* reset phy for connection */
        usbhs_platform_call(priv, phy_reset, pdev);

+       dev_info(dev, "%s:%d\n", __func__, __LINE__);
        /* power control */
        pm_runtime_enable(dev);
+       clock_enabled =3D true;
        if (!usbhs_get_dparam(priv, runtime_pwctrl)) {
                usbhsc_power_ctrl(priv, 1);
                usbhs_mod_autonomy_mode(priv);

Cheers,
Prabhakar

