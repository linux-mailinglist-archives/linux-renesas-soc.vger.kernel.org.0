Return-Path: <linux-renesas-soc+bounces-15548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCBBA7FE0A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 13:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A66693AA79B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Apr 2025 11:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0271C2686AA;
	Tue,  8 Apr 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXLmUgX6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A67268691;
	Tue,  8 Apr 2025 10:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744109954; cv=none; b=rbVbnHw49aptuoikD73K+kwth0YFHcwD9fHfSOWuBaPuOAms0TD2Al46Ua0h1AUUE/knJ9RfO3n3HCOaEbar3k4FaSkMe2uK2hFNXqB+Opuir3bp9R3TjxeJHhmpA5Jzl8kHVi4/pMiZ1Vf+TnlWck0QMXcv0tEv4mUHQnVE038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744109954; c=relaxed/simple;
	bh=4on2MS2K6tN2z4erGykPVxbs0Ble8bub1VJ+PLsGcOw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aloekne7N1iMOQ2nOBHAPi2bdpcyCr496diNk4h5eTtDonvCBiu1RRb/doKO4ZuatNa/+CnjU4YI7W/pk0k/aBoWy+o1flPPEPf/8gy04AmL3zhgUo4tHYFA7U68ehYtGp6rrM+bdYrc3svzkmHnjhFg8lBqBEA+CvACGaul+bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXLmUgX6; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-523eb86b31aso2522646e0c.0;
        Tue, 08 Apr 2025 03:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744109952; x=1744714752; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6P/uNfcHg+jGYZuhU1R54YrzF1C6oo3BgR7dped6QU=;
        b=KXLmUgX6o3W4jISJPKKm1vdTxmSNX1dURV/EOmNPmQ7WIhewUsvlFDGJBAPx2i5g6o
         oOZkjSFmjrEjaqOup1tZsN/ssh6EX407KebYy4oqAp8abrPRkz22srStUwde0smwWcSS
         noGQsdyto76aW0AItCy4NY45Q9HG/qZyUI8hBbjS7SISWfV0z3knsJDBhfnbQI0ruhpM
         A2P55j+DqDOnHIB859v9C0nT/alZRWum14PS92POYurPqbkMeyfV5Jwmlr0/mZtG5aQL
         gBdN0piPgQ1hkPz/Qaof7t78migqHmTPuIZjHPASjwD5TLvPNmHnzZ+tmsXaC4e2jGEp
         +S2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744109952; x=1744714752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6P/uNfcHg+jGYZuhU1R54YrzF1C6oo3BgR7dped6QU=;
        b=q9sqkeVI127kxaBhMTRQH5upDPg/lYCRnxGFakCK36IDr9jCIBr73ILVUoSWygkJks
         LvNI9z4/KtEQpWl1sottRRxKs9thpoaaMFBwBDtJ1s0TRbiSvuFYgD4KzH1Fg4OgxBXm
         vQxVTAD7yoUvPd9adpZoYtQzcDWyeQH6PIcUEZZT6kcsSaLr80WI/yReZ2gHhkkmxIrQ
         qlwYATIDqn/USIEs/A4Y/R2jaCc9UbOPjP+dMEnCo9rsKGy8fjeO6wupiBuFbL5pwAbj
         ssK2nadMdKHqSCKUOXFMn5zjDx805eNVYdvSejIXHa19r0aJggBmK9W6LuJT7wHTzY3S
         KqWg==
X-Forwarded-Encrypted: i=1; AJvYcCV5nDcwfKlWD56YU8LQjD+AH6xLTyzKWhhRfMW/yr0AL4RyOdhM9KG2vedwjGh6ijypybItoJAlVaj0@vger.kernel.org, AJvYcCVjlgA7T+MyCigJDnHDhLGPiAgM6JXdjiApSmyp9aVOj0bN8Yovy0NJCpeZyBkvjiK6iXCef1ix5Mxin+KYI3GSYBI=@vger.kernel.org, AJvYcCVw+WW5PICeSuIDaEVjhsRBsvxFImWmfAHugDX7DujhET9Eb2kgB8+CPSDIQM5hj/biuighQY3Lw6qwGfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbagrMZeIyGY+igWOzu4QLav8Yt5xmmVAR5JaBwV1uYksi2f8G
	/h5T8+JtliIJ2NXETeawqdQEHWlqbkiiuDpzQZR9IbpaA4M8eJN5ikp95vvf93CSlQoa4t8uEkr
	3ns2htGaJb7GcswcrViNSDwVpoGU=
X-Gm-Gg: ASbGnctqTdHXKGJKsk/68C+aM1xyVx+qvnn/w1KBBlwGM3bomVjTdWAO3u550A2PhqD
	wV9G4Y6iQjkxy2DrR4AzfxUyfU6Y0f6SISSZLLeY+414qoNdhZwEbh5Kbp+dwqjO+7iJFJJTp+j
	VpRAL9aL771tDhKIp5Je/CqvCVQA==
X-Google-Smtp-Source: AGHT+IGvslA9MnpeWUJpUBZ2mdY3BG2rfT6pr6/D6pjZGzw81NBw9QTMxUEMzWPrQNV7Hu1kGWhDcAsMGGqKXSm3X0k=
X-Received: by 2002:a05:6122:179d:b0:526:1ddc:6354 with SMTP id
 71dfb90a1353d-5276431a1c7mr10923391e0c.0.1744109951759; Tue, 08 Apr 2025
 03:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407105002.107181-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11040727E81F6DF8647D92343D8B52@TYCPR01MB11040.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Apr 2025 10:58:45 +0000
X-Gm-Features: ATxdqUGSTfRrUSQuZCZoyjAkkzlvIl3VoLiMfd5E9qXmS5dtGU0CulH0wbzFg4Y
Message-ID: <CA+V-a8sWSOtgpbQT7+LEB8_WoEYyd4P6WDJn-DUQuOUA_ZP7xw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] usb: renesas_usbhs: Reorder clock handling and
 power management in probe
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shimoda-san,

Thank you for the review.

On Tue, Apr 8, 2025 at 11:40=E2=80=AFAM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Hello Prabhakar-san,
>
> Thank you for the patch!
>
> > From: Prabhakar, Sent: Monday, April 7, 2025 7:50 PM
> >
> > Reorder the initialization sequence in `usbhs_probe()` to enable runtim=
e
> > PM before accessing registers, preventing potential crashes due to
> > uninitialized clocks.
>
> Just for a record. I don't know why, but the issue didn't occur on the or=
iginal code
> with my environment (R-Car H3). But, anyway, I understood that we need th=
is patch for RZ/V2H.
>
Looking at the r8a77951.dtsi we have the below:

hsusb: usb@e6590000 {
        compatible =3D "renesas,usbhs-r8a7795",
        ...
        clocks =3D <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
        ....
};

The same clocks are used for ehci0/ohci0/phy0 in  r8a77951.dtsi,
probably by the time we reach probing the usbhs driver these clocks
may have been already enabled hence we might not see this issue.


> ----- I added some debug printk -----
> <snip>
> [    3.193400] usbhs_probe:706
> [    3.196204] usbhs_probe:710
> [    3.199012] usbhs_probe:715
> [    3.201808] usbhs_probe:720
> [    3.204605] usbhs_read: reg =3D 0
> [    3.207754] usbhs_write: reg =3D 0, data =3D 20
> [    3.211941] usbhs_probe:727
> [    3.214738] usbhs_read: reg =3D 102
> [    3.218061] usbhs_write: reg =3D 102, data =3D 4000
> [    3.222697] usbhs_read: reg =3D 0
> [    3.225845] usbhs_write: reg =3D 0, data =3D 420
> [    3.230118] usbhs_write: reg =3D 30, data =3D 0
> [    3.234304] usbhs_write: reg =3D 32, data =3D 0
> [    3.238489] usbhs_write: reg =3D 3a, data =3D 0
> [    3.242673] usbhs_write: reg =3D 36, data =3D 0
> [    3.246859] usbhs_write: reg =3D 30, data =3D 8000
> [    3.251312] usbhs_read: reg =3D 40
> [    3.254540] renesas_usbhs e659c000.usb: probed
> [    3.802010] usbhs_probe:690
> [    3.808677] renesas-cpg-mssr e6150000.clock-controller: MSTP 704/hsusb=
 ON
> -----
>
> > Currently, in the probe path, registers are accessed before enabling th=
e
> > clocks, leading to a synchronous external abort on the RZ/V2H SoC.
> > The problematic call flow is as follows:
> >
> >     usbhs_probe()
> >         usbhs_sys_clock_ctrl()
> >             usbhs_bset()
> >                 usbhs_write()
> >                     iowrite16()  <-- Register access before enabling cl=
ocks
> >
> > Since `iowrite16()` is performed without ensuring the required clocks a=
re
> > enabled, this can lead to access errors. To fix this, enable PM runtime
> > early in the probe function and ensure clocks are acquired before regis=
ter
> > access, preventing crashes like the following on RZ/V2H:
> >
> > [13.272640] Internal error: synchronous external abort: 000000009600001=
0 [#1] PREEMPT SMP
> > [13.280814] Modules linked in: cec renesas_usbhs(+) drm_kms_helper fuse=
 drm backlight ipv6
> > [13.289088] CPU: 1 UID: 0 PID: 195 Comm: (udev-worker) Not tainted 6.14=
.0-rc7+ #98
> > [13.296640] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h=
44 (DT)
> > [13.303834] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
> > [13.310770] pc : usbhs_bset+0x14/0x4c [renesas_usbhs]
> > [13.315831] lr : usbhs_probe+0x2e4/0x5ac [renesas_usbhs]
> > [13.321138] sp : ffff8000827e3850
> > [13.324438] x29: ffff8000827e3860 x28: 0000000000000000 x27: ffff800082=
7e3ca0
> > [13.331554] x26: ffff8000827e3ba0 x25: ffff800081729668 x24: 0000000000=
000025
> > [13.338670] x23: ffff0000c0f08000 x22: 0000000000000000 x21: ffff0000c0=
f08010
> > [13.345783] x20: 0000000000000000 x19: ffff0000c3b52080 x18: 00000000ff=
ffffff
> > [13.352895] x17: 0000000000000000 x16: 0000000000000000 x15: ffff800082=
7e36ce
> > [13.360009] x14: 00000000000003d7 x13: 00000000000003d7 x12: 0000000000=
000000
> > [13.367122] x11: 0000000000000000 x10: 0000000000000aa0 x9 : ffff800082=
7e3750
> > [13.374235] x8 : ffff0000c1850b00 x7 : 0000000003826060 x6 : 0000000000=
00001c
> > [13.381347] x5 : 000000030d5fcc00 x4 : ffff8000825c0000 x3 : 0000000000=
000000
> > [13.388459] x2 : 0000000000000400 x1 : 0000000000000000 x0 : ffff0000c3=
b52080
> > [13.395574] Call trace:
> > [13.398013]  usbhs_bset+0x14/0x4c [renesas_usbhs] (P)
> > [13.403076]  platform_probe+0x68/0xdc
> > [13.406738]  really_probe+0xbc/0x2c0
> > [13.410306]  __driver_probe_device+0x78/0x120
> > [13.414653]  driver_probe_device+0x3c/0x154
> > [13.418825]  __driver_attach+0x90/0x1a0
> > [13.422647]  bus_for_each_dev+0x7c/0xe0
> > [13.426470]  driver_attach+0x24/0x30
> > [13.430032]  bus_add_driver+0xe4/0x208
> > [13.433766]  driver_register+0x68/0x130
> > [13.437587]  __platform_driver_register+0x24/0x30
> > [13.442273]  renesas_usbhs_driver_init+0x20/0x1000 [renesas_usbhs]
> > [13.448450]  do_one_initcall+0x60/0x1d4
> > [13.452276]  do_init_module+0x54/0x1f8
> > [13.456014]  load_module+0x1754/0x1c98
> > [13.459750]  init_module_from_file+0x88/0xcc
> > [13.464004]  __arm64_sys_finit_module+0x1c4/0x328
> > [13.468689]  invoke_syscall+0x48/0x104
> > [13.472426]  el0_svc_common.constprop.0+0xc0/0xe0
> > [13.477113]  do_el0_svc+0x1c/0x28
> > [13.480415]  el0_svc+0x30/0xcc
> > [13.483460]  el0t_64_sync_handler+0x10c/0x138
> > [13.487800]  el0t_64_sync+0x198/0x19c
> > [13.491453] Code: 2a0103e1 12003c42 12003c63 8b010084 (79400084)
> > [13.497522] ---[ end trace 0000000000000000 ]---
> >
> > Fixes: f1407d5c66240 ("usb: renesas_usbhs: Add Renesas USBHS common cod=
e")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/usb/renesas_usbhs/common.c | 50 +++++++++++++++++++++++-------
> >  1 file changed, 38 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_u=
sbhs/common.c
> > index 703cf5d0cb41..f52418fe3fd4 100644
> > --- a/drivers/usb/renesas_usbhs/common.c
> > +++ b/drivers/usb/renesas_usbhs/common.c
> > @@ -685,10 +685,29 @@ static int usbhs_probe(struct platform_device *pd=
ev)
> >       INIT_DELAYED_WORK(&priv->notify_hotplug_work, usbhsc_notify_hotpl=
ug);
> >       spin_lock_init(usbhs_priv_to_lock(priv));
> >
> > +     /*
> > +      * Acquire clocks and enable power management (PM) early in the
> > +      * probe process, as the driver accesses registers during
> > +      * initialization. Ensure the device is active before proceeding.
> > +      */
> > +     pm_runtime_enable(dev);
> > +
> > +     ret =3D usbhsc_clk_get(dev, priv);
> > +     if (ret)
> > +             goto probe_pm_disable;
> > +
> > +     ret =3D pm_runtime_resume_and_get(dev);
> > +     if (ret)
> > +             goto probe_clk_put;
> > +
> > +     ret =3D usbhsc_clk_prepare_enable(priv);
> > +     if (ret)
> > +             goto probe_pm_put;
> > +
>
> Did you really need to call these functions at this timing?
> IIUC, usbhs_{pipe,fifo,mod}_probe() will not access any registers.
>
Actually the code path does access the registers,  with
`CONFIG_USB_G_SERIAL=3Dy` I get the below without this patch.

[14.318626] g_serial gadget.0: g_serial ready
[14.323923] Internal error: synchronous external abort:
0000000096000010 [#1] PREEMPT SMP
[14.332107] Modules linked in: rzg2l_mipi_dsi rcar_fcp
renesas_usbhs(+) drm_shmem_helper display_connector gpu_sched
drm_kms_helper fuse drm backlight ipv6
[14.346025] CPU: 1 UID: 0 PID: 187 Comm: (udev-worker) Not tainted
6.14.0-rc7+ #99
[14.353578] Hardware name: Renesas RZ/V2H EVK Board based on r9a09g057h44 (=
DT)
[14.360775] pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=3D-=
-)
[14.367711] pc : usbhs_sys_function_pullup+0x10/0x40 [renesas_usbhs]
[14.374082] lr : usbhsg_update_pullup+0x58/0x68 [renesas_usbhs]
[14.374107] sp : ffff80008278b460
[14.374110] x29: ffff80008278b460 x28: ffff800079a355f0 x27: 00000000000000=
0a
[14.374122] x26: ffff800079a35d00 x25: ffff0000c3c26b40 x24: ffff8000817bb1=
c0
[14.374131] x23: ffff0000c33cd800 x22: ffff0000c221e480 x21: ffff0000c221e5=
40
[14.374140] x20: 0000000000000001 x19: ffff0000c221e480 x18: 00000000000000=
00
[14.374148] x17: 0000000000000000 x16: 0000000000000000 x15: 00000000000000=
00
[14.374156] x14: 0000000000000074 x13: ffff0000c33ac680 x12: 00000000000000=
00
[14.374164] x11: ffff0000c33ac680 x10: 0000000000000aa0 x9 : ffff80008278b1=
60
[14.374172] x8 : ffff0000c33ad100 x7 : 0000000002307a83 x6 : 00000000000003=
2c
[14.374180] x5 : ffff0003fdfb4388 x4 : 0000000000000000 x3 : 00000000000000=
00
[14.374187] x2 : 0000000000000010 x1 : ffff8000825a0000 x0 : ffff0000c221e4=
80
[14.374197] Call trace:
[14.374200]  usbhs_sys_function_pullup+0x10/0x40 [renesas_usbhs] (P)
[14.374220]  usbhsg_pullup+0x54/0x78 [renesas_usbhs]
[14.374236]  usb_gadget_connect_locked+0x44/0x8c
[14.374249]  gadget_bind_driver+0x198/0x284
[14.374256]  really_probe+0xbc/0x2c0
[14.374266]  __driver_probe_device+0x78/0x120
[14.374272]  driver_probe_device+0x3c/0x154
[14.374278]  __device_attach_driver+0xb8/0x140
[14.374285]  bus_for_each_drv+0x88/0xe8
[14.374292]  __device_attach+0xa0/0x190
[14.374299]  device_initial_probe+0x14/0x20
[14.374306]  bus_probe_device+0xb4/0xc0
[14.374312]  device_add+0x5c4/0x7a0
[14.374318]  usb_add_gadget+0x198/0x220
[14.374324]  usb_add_gadget_udc+0x68/0xa0
[14.374330]  usbhs_mod_gadget_probe+0x218/0x2c4 [renesas_usbhs]
[14.374347]  usbhs_mod_probe+0x30/0xc0 [renesas_usbhs]
[14.374363]  usbhs_probe+0x208/0x5a0 [renesas_usbhs]
[14.374378]  platform_probe+0x68/0xdc
[14.374387]  really_probe+0xbc/0x2c0
[14.374394]  __driver_probe_device+0x78/0x120
[14.374400]  driver_probe_device+0x3c/0x154
[14.374407]  __driver_attach+0x90/0x1a0
[14.374413]  bus_for_each_dev+0x7c/0xe0
[14.374419]  driver_attach+0x24/0x30
[14.374425]  bus_add_driver+0xe4/0x208
[14.374432]  driver_register+0x68/0x130
[14.374438]  __platform_driver_register+0x24/0x30
[14.374446]  renesas_usbhs_driver_init+0x20/0x1000 [renesas_usbhs]
[14.374462]  do_one_initcall+0x60/0x1d4
[14.374474]  do_init_module+0x54/0x1f8
[14.374484]  load_module+0x1754/0x1c98
[14.374492]  init_module_from_file+0x88/0xcc
[14.374499]  __arm64_sys_finit_module+0x1c4/0x328
[14.374506]  invoke_syscall+0x48/0x104
[14.374516]  el0_svc_common.constprop.0+0xc0/0xe0
[14.374524]  do_el0_svc+0x1c/0x28
[14.374530]  el0_svc+0x30/0xcc
[14.374539]  el0t_64_sync_handler+0x10c/0x138
[14.374546]  el0t_64_sync+0x198/0x19c
[14.374558] Code: 7100003f 1a9f07e2 f9400001 531c6c42 (79400021)
[14.374564] ---[ end trace 0000000000000000 ]---

Cheers,
Prabhakar

