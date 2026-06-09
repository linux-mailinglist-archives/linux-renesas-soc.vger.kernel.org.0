Return-Path: <linux-renesas-soc+bounces-33776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sN+BLYJBKGqEBAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:38:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E865662775
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:38:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KadJilbx;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0B28230300EB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 16:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B0F3B27EC;
	Tue,  9 Jun 2026 16:28:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDA933DED5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 16:28:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022535; cv=pass; b=W/aSwIiT45kxeIpyibSFKyTeu/iuWTyGhRxm2MTWdDiSrUkQURcQP8/LVqLTwXbgAeFlySUENYXvw9rS6YEENGkS8ADrRM9izZ5MLvXMAgveyl0bLn0gLeJhfl7WIDhaJvNbfC7DsDYoHe8djqR4cFF3/3d4D/PRM6fUw/BlsKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022535; c=relaxed/simple;
	bh=H83i8Cb+cpZkV/IEBmS/QlZKHgw/PIb9DZ6YI97XEFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5CYC++vKLavMdsuCQWndALe9YcRMV3mfrCfY4nSpx90Ok67LUS+Ffu29EpozARun4FJvIetVrg9id5Re6x/9IWXNXdvGAXfrBJe5+SZiwT1yVL16sVO9U8f2ifswpWPxCVTqeIN4MpDMAyZ4TyfT3KFCLgxCriviOsSjuy+490=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KadJilbx; arc=pass smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef372c58aso3071641f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 09:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022533; cv=none;
        d=google.com; s=arc-20240605;
        b=b1QnEMJ2MYy0NyQfgwY54FMn+ObzqPiJ6YORWZzwzXiCOJxZUIKzqfp+tXZEG3aahK
         H7h/ye7Ien5zDOf4RH0lc6954kaJtyyUhRB0fCJnpY8FcnH5jfXlXkzoVuauNG+aR8ig
         KzotUI9QWzEEIBGgv8+/QaOWgJhCDNICneTcG6x5DeR7/nf9FBEN6m9V8yaCoeU/AOlg
         vYQJXMHFn51DalycTJ67z6ihcR6cMtRljJi96wMDRlOyjqsQIV1VZHluE+z1Tdpe6Cti
         MeaT3ets3Kao3W2B0j9z+7ro+A4ObuOyUfpe4e4jy42e79QSY8iCKt3k5b2ZMOQXIDsh
         cSfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        fh=grLA/PineYnGdLbvtgSHW/ajGVvjX7Y6CitcYyhYkzk=;
        b=HPJZD6yESr4Thla4BvHdoIonk+D5CPHq7spjLJZuvkadHy8rmqdmboG48XbTSsP46p
         uKG2I8zuhe7yOIfmO+jRpOBig2TXcaiN4iy2TLeMjryhPBArw+t/VFSrxHvbgPpbHRkm
         f9W+WHHvFi0r/U7SAsyjHeMqe2CVtPkOD31frZ6QpQv39w3A0a+eTyiI+774puDNty6g
         EDCotMiF8Mb4lTXGJRzdlMJv17KstgF56cHbf6n6vrRSux2NOYO4BzXhtFA6z1Apq/qm
         UTgJjZtrpwlPb3PLggrD9kOqrWlnoQUnfv3tAsQ1BNnFlKCuyoVgjN6E2T2mH1xrJbwV
         UzYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022533; x=1781627333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=KadJilbx1aKNqhtjc4c4+KTRdxo/d7Sn8Y7E4FVOqkhAc+G/UHFFNpXQuFII3qQJRW
         LLJg0WRDZNmTvk0EKayKaULt/ueWDRMyYq8HeG+d5aNq3KHvQYdyHKuYGAWI0sb1X4Y2
         vJxEMJSnlDgFhksIK1JNpIWchzfR1uZafoL+BqihuzbclUGmCq4tEPvaV6ErjsSHReQ4
         Aybh9gGxSC6xsTtjYGxetdsjS4jx7Rwo1H1tWpV5CWycgJtboEA9WfTWcRw/uQQ9+G/k
         0uqMPQyNeDcvadPyEaMQNfNY88DvFjQs/1XMMPfaSJghtF3terY5YFDOSW+GHWoZuE8m
         Te/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022533; x=1781627333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vSUF15Jri5gWyOV5bUtSHVarxchoXkeLTNdzi8zMmFM=;
        b=U8nX7AHVKuOPwF9VQEuDURyoZUzoMcKzCVURwVwAJTpQ+bl+s4DFPcB+srNsbZuhqY
         mCHDOQoXdPK+q2oRT5+Hexko/1jYBsuuDYx7lQwKxpFKMDQlnb5OBDBoHf6hBq5uOZYD
         HVLEJEzGLm5qOAcqolyo21M1uFCW0o85x1Z48J/GdpjeGlSRnkkWRhKXHEgruIOyZuUM
         gDBjNO5g9O0VP5HwhMxLManjRR2HFm9xg+O+ogd3RlFfjom8w+/A13wv0vJp3Hz6LWIH
         eFPhsoDl41vOTSpCo1I8qBVa1sOweoWzi0PnxUWBi199lpzkGLwPaB9ZEmUse6S43AOc
         40hg==
X-Gm-Message-State: AOJu0YwZFYVNANhJ0QWsJdApT7q+nvJCRhPAFTefc9HGL+TfjgKzmftU
	VSjkGd4Z9OAX5fCRNBt7b5cauim4QNjqMA0neoWjKXfIR+rAyZztHugyvp44xsPHfhErESWdeVS
	P6LLSoJZ+9BHlk/kr3EPpStQrs230LaE=
X-Gm-Gg: Acq92OF9jHJimkGizPok7oy6nyE5aWh0JrzAXh+CflHpuk7NPKKf6akuexld/LTtBQY
	keuSB5eOh9nLNinbNxdIk64wsXv30KPbrEvka9WJrE/TuOKy9G08t2TyCfNTu2SJGOEW6mCPArW
	J68Pvz+ryc8FAt8yX4HTZUodHek5ggQGYVgQCYY5XWNekpvwE7sjgXunUiwtCWJFlSWpR4yBPC1
	uYgmhXAkIRBnLArzTJudeHr1xK6cp43a5i8oePLUfp8q7fF0fX7luWoU8HAf/Ezuf9NKqIzP6bp
	UXbIwHjC6smmD2JNA3Yj4lczYnoGW/hJfq0izkBGv1xedFXVPgeQ3l/P1vj0jb6qwkhSlaK0RNr
	eOhVgi1sW/CC6tA==
X-Received: by 2002:adf:f250:0:b0:45e:f271:5019 with SMTP id
 ffacd0b85a97d-46030506f41mr23775351f8f.14.1781022532357; Tue, 09 Jun 2026
 09:28:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609125353.401124-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260609143048.8B0DE1F00898@smtp.kernel.org>
In-Reply-To: <20260609143048.8B0DE1F00898@smtp.kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 9 Jun 2026 17:28:26 +0100
X-Gm-Features: AVVi8CfbvHgFCCNC6XekzrLzABrskwBcGCTqQD_mJN6zpisSCK3G7k2nfPZ4W5E
Message-ID: <CA+V-a8vxP6vPx2T+3s7ObVwifx9FqnLfLdq9OpYGFWNu=8oxOQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: Add LCDC overlays for RZ/T2H and
 RZ/N2H EVKs with ADV7513
To: sashiko-reviews@lists.linux.dev
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:wsa@sang-engineering.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33776-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E865662775

On Tue, Jun 9, 2026 at 3:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] The RZ/N2H overlay fails to disable conflicting devices (`led-=
7`, `key-1`, and `sdhi1`), causing pinctrl and physical hardware collisions=
.
> - [Low] Typo in the Makefile causes the composite DTB for the RZ/N2H EVK =
to be incorrectly named with 'rzt2h' instead of 'rzn2h'.
> --
>
> commit efe0a5ca8f3fdb36ded9b05e9b5a45260bb5135a
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: Add LCDC overlays for RZ/T2H and RZ/N2H EVKs with AD=
V7513
>
> This commit adds device tree overlay support to enable the DU/LCDC pipeli=
ne
> on the RZ/T2H and RZ/N2H evaluation kits. It configures the overlays for =
use
> with a CN15/CN20 ADV7513 HDMI transmitter.
>
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts=
/renesas/Makefile
> > index ca45d2857ea7f..0f64a8820e374 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> [ ... ]
> > @@ -215,8 +215,14 @@ r9a09g057h48-kakip-pixpaper-dtbs :=3D r9a09g057h48=
-kakip.dtb r9a09g057h48-kakip-pi
> >  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h48-kakip-pixpaper.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-evk-cn15-lcdc.dtbo
> > +r9a09g077m44-rzt2h-evk-cn15-lcdc-dtbs :=3D r9a09g077m44-rzt2h-evk.dtb =
r9a09g077m44-evk-cn15-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G077) +=3D r9a09g077m44-rzt2h-evk-cn15-lcdc.dtb
> >
> >  dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
> > +r9a09g087m44-rzt2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb =
r9a09g087m44-evk-cn20-lcdc.dtbo
> > +dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzt2h-evk-cn20-lcdc.dtb
>
> [Severity: Low]
> Does this code contain a copy-paste typo? The target is the RZ/N2H EVK, b=
ut
> the variables use rzt2h instead of rzn2h for the composite DTB names.
>
Yes you are right, this hunk should be like this:
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk.dtb
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-evk-cn20-lcdc.dtbo
r9a09g087m44-rzn2h-evk-cn20-lcdc-dtbs :=3D r9a09g087m44-rzn2h-evk.dtb
r9a09g087m44-evk-cn20-lcdc.dtbo
dtb-$(CONFIG_ARCH_R9A09G087) +=3D r9a09g087m44-rzn2h-evk-cn20-lcdc.dtb


> > diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dts=
o b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> > new file mode 100644
> > index 0000000000000..bc8a91278920e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-evk-cn20-lcdc.dtso
> [ ... ]
> > +&{/leds/led-4} {
> > +     /* P18_1 is used for DU function LCDC_DATB2. */
> > +     status =3D "disabled";
> > +};
> > +
> > +&i2c0 {
> > +     status =3D "disabled";
> > +};
>
> [Severity: Medium]
> Does this overlay omit disabling conflicting devices like led-7, key-1, a=
nd
> sdhi1?
>
Agreed, led-7 and key-1 need to be explicitly disabled. Regarding
SDHI1 the manual had a typo so just dropping the comment should be OK.

Cheers,
Prabhakar

