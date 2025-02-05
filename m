Return-Path: <linux-renesas-soc+bounces-12848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB994A284CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 08:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05D533A6CEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 07:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2139228387;
	Wed,  5 Feb 2025 07:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="oxPngrbI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB521773E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 07:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738738899; cv=none; b=NkwaHfSMzDEuvNi1aUWdbNfjhcvGGeu90vs2HCuuZAVp4nYhuwlA2CJLkzqX2qi3FbxTso4YZhGBEubW8fov3E/UoyWOFN/KRP/i/eNtROJFvE+SFGZoVINtHwWhVjgYxPwQAfTLls+lOSOwwttVXM2N7UEhsdRVGlAu01i9uJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738738899; c=relaxed/simple;
	bh=VquThC1P7xRhIkunqD4o5ESA2B7nVEhFyRffv7zLiW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GAd+IMeWr9gy9C/SOIdH3m2kLL6QeZL53GWKwMJfU457ueQslNYyiMY44QmiJaaSjw7OB5mB0fxU6bf2/bjEVDxtNK+/6l1o8EUEO9qTZPDnU+P8VnrOZmyESr6T6kKEvURW/Y4/GE0wrZGIZ3AwbzSSHoAp7wX2Wcm6cAGYgx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=oxPngrbI; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab70043cd05so1029450366b.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Feb 2025 23:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1738738896; x=1739343696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6fF1eROQX3sxUXGc4VeyxV/l34nZf3RV2dnRfhS7BwQ=;
        b=oxPngrbIf33VSqUqAnXc5hjADFEX/8LmvSzLfUoqMtnz8a4HvoNNAwe3gilhgJfs0N
         mBNUvZpGgVdUmo7pbYGVkXb0gaJLfYb2zCDzE3YXDdnKhDt3DiXfjjLJAF84wjAGX5Lw
         kB5CtRKXqDY8lNJJkW0LIwB2w0ymeuWs9HEuoIrg8dxtCZC2Pa4FxFJQFDYpFr1e/lJz
         UJhcRyez3HSLFOhvagIYdnwUehr63J7TsU+ITiA+hee/MQ+oo52RWaW4S/VpOpPu2sRT
         tVCYmFLoQDuwYKYrfTAo4B/KGbG8/5rMaSi/7em+eFK8QS954dAgFQMKM6JebTFDoAnL
         PkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738896; x=1739343696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6fF1eROQX3sxUXGc4VeyxV/l34nZf3RV2dnRfhS7BwQ=;
        b=hOD2oMPguQH498j+VeeVUELCOr4/2LwIc5MurCnfnCM4wS2P/IylN5eIhxUNPqbwnm
         S1Bmf9ckfA+D+HKQd8EV2zChuA1S4PmVIo/sYkNg4zHn5oq97Vd4j9IPctzFXioobFmS
         KB5MwxVOZs/MODLeAXcLssoTU5O4Y+O2faROf8NAhztFF/IatZ/a0usu7z1KdaeIHbBs
         aIvWQSMib0pM7e08hVQIFP4cNNuNVthaT05BlLTJoF7mz6uhm7ziCeoHgzGZ7nt8R1PF
         nSoIDkBm9LcJX7O4wu+ybNRVTw7CH/p5nE8RLKedXiE7DXMEII/93Ikn1ne9fbMb+xzG
         BLHw==
X-Forwarded-Encrypted: i=1; AJvYcCUV9RUY+tF5pSDiBouX7ARYMmGZxT/FEYBJx+ot99br1RwuVRwmQrCldH76CMn/NIfK9MrW+j7qC9ED97YauwWoYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzli3xxO0H2/yFXlr1eN73X3yd158aaWVT0o/MbMZK5Gg3WNM9e
	y57qedUCDIH7Ui36aFNSmH0SDXHLMKeKHCBBwIfaGsjAlgKqx/t+jSckNOaPrr9loxtpt1kfKgt
	qzFZp/2Ev4h093UhamHDDkyig/OF8nNIN343pqIxtZiEnWhsjTEA=
X-Gm-Gg: ASbGncsuoVjzU41t26zUlen9xMebuSVON+4/6i2n4UQr50A6ReBg2PLtjos1qdhs3TQ
	QZkZv3CqEhXIrzv76l991Dab+V18wqXkt83IeHZ/L/9cTilWJ1RvCbJAjgjVh8hI60ciU5tnG0P
	riGfafqKQR143W9wZuxkk3xvMH0XR+DA==
X-Google-Smtp-Source: AGHT+IFI7oXEdlBj3f8jzL89HdDtlLGM7Z3J5KZB0+W2fMSSLaeuf+o0GJZWUeGTNxD5BtW3fkD03mVacNdtT4HuvS8=
X-Received: by 2002:a17:907:9708:b0:ab6:597a:f5ee with SMTP id
 a640c23a62f3a-ab75e24bff5mr117977666b.12.1738738895951; Tue, 04 Feb 2025
 23:01:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250131112849.120078-1-biju.das.jz@bp.renesas.com>
 <20250131112849.120078-2-biju.das.jz@bp.renesas.com> <TY3PR01MB113469AB8C9B228E73673F88786F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113469AB8C9B228E73673F88786F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Wed, 5 Feb 2025 16:01:09 +0900
X-Gm-Features: AWEUYZlwinpeplzLNCplRUzuuHcgKuUzpp17FercCWalV20ptwh-43hQl1jXVhM
Message-ID: <CABMQnVJ6OrtAcbCQG4d_gdEDZBJ9C_Ghh1Yrrs=n+HwA8pNGzw@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] arm64: dts: renesas: r9a09g057: Add support for
 enabling SDHI internal regulator
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,


2025=E5=B9=B42=E6=9C=884=E6=97=A5(=E7=81=AB) 18:48 Biju Das <biju.das.jz@bp=
.renesas.com>:
>
> Hi all,
>
> I need to send a patch for fixing the build issue for r9a09g057h48-kakip.=
dts
> as this board is introduced in latest renesas-devel/linux-next[1].
>
> I will send next version, after getting some feedback on the current seri=
es.
>
> arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts:42.36-50.4: ERROR (dup=
licate_label): /regulator-vccq-sdhi0: Duplicate label 'vqmmc_sdhi0' on /reg=
ulator-vccq-sdhi0 and /soc/mmc@15c00000/vqmmc-regulator
>

You may have already made a patch, but I also created a patch and
confirmed working.

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
index d2586d278769e2..090d9c69fd75ec 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
@@ -39,7 +39,7 @@ reg_3p3v: regulator-3v3 {
         regulator-always-on;
     };

-    vqmmc_sdhi0: regulator-vccq-sdhi0 {
+    vqmmc_sdhi0_gpio: regulator-vccq-sdhi0 {
         compatible =3D "regulator-gpio";
         regulator-name =3D "SDHI0 VccQ";
         gpios =3D <&pinctrl RZV2H_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
@@ -129,7 +129,7 @@ &sdhi0 {
     pinctrl-0 =3D <&sdhi0_pins>;
     pinctrl-names =3D "default";
     vmmc-supply =3D <&reg_3p3v>;
-    vqmmc-supply =3D <&vqmmc_sdhi0>;
+    vqmmc-supply =3D <&vqmmc_sdhi0_gpio>;
     bus-width =3D <4>;

     status =3D "okay";

> Cheers,
> Biju

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

