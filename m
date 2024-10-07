Return-Path: <linux-renesas-soc+bounces-9544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2273B993620
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D16DD282768
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949C51DDC36;
	Mon,  7 Oct 2024 18:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCyyi/UW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8C1DDC0C;
	Mon,  7 Oct 2024 18:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325508; cv=none; b=azp4sSUPmMSBj5xlU06EA0lCmK3JyVhDlmLp5RY5r77NJwhAX7pgkx/zBF8xAnreSwuUZWZVev+enyxGhNJ+H8WCSngvJ0aQlmfe1zE07jgjXPLhXQVqj/93VWh4ES7efINiK4DO6Ap4bR0wePOEqqmi6y9lptsZ/EzJv9S69XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325508; c=relaxed/simple;
	bh=I1laxIx6uj2eMvTU6YxrqrxVj8tbVyjB/oXOOYwD9kM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/PooK9X4yQVdPc7H4OJyYguszvIDeGUe2Ng1BRlWPCoEeYRMHL2DHOZJup9FjSTos8oKmW2U7yLTPWTF6Y16x8aiwKPapVq3nRuWdluZS5z6/zGjoUXWmcJ3G8lRWzSfYzzMf7pXf2iaTkTW62oyEGvKdCyFT8Pfta0MEVqnRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCyyi/UW; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50792ed3ad9so1342186e0c.3;
        Mon, 07 Oct 2024 11:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325506; x=1728930306; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+i+MfgMNbb6REMbZ9LEKkQ4cTCE2FPAazrxAKZ/Ogk=;
        b=XCyyi/UWqf8uygrVzy/xnJz4sXr9xCSZYSDTz7fuRhHmoBENSaxZuA1I2iaLPiF76S
         aPb5zXuVwubbYQJWIp6iOQqT7ytQt2B222N6Gkv0MqEBDgDQjw43gOu6+4O6kFcYlIdQ
         7TAbYWRZ+4YN4eDh9VhkOHJH+oQFkU669Ov8WrLNUAaFxm7yWX46P8lInvVjxNxcP/+Z
         LDTDrtd6VsryaY+vGlZjISgg9iIO/U25tyvDX+qQtoIduiD8vG7vv41K3psxU/gE7P0/
         icUKkTVkTr6Z7fP87LClOcWSuLJ1s7/VoQyhw7PY5HGhnGT7dKcjNO3O8tGw7v5SFHHx
         ICfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325506; x=1728930306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+i+MfgMNbb6REMbZ9LEKkQ4cTCE2FPAazrxAKZ/Ogk=;
        b=gAWRIiv95mPfIF2xfRoLkkaZ5j7sL/kGv3JAn4bBiYaHwL7k5SN6Be/HLjiQWk23wA
         +bHSsRvT7hYIFcVwMfNeZ5UdaOeqM2custjpV5RiAyMKlL9vF5P3MqfXzWHe0TmJmbAp
         DZFyKp4cQv/erHY8btrQ/PFhoF+irR2v+042HJGsxvxCmyMSvRkmSkBtoJlP+hvNEPk9
         y8/1dvBY8qpp9VKxmq/geDByN8AOYLd7k0x+HaPaNTf0WxyTIXCmfhqzg4JDwLrkLERh
         zqyN5DgvNeu7UJ0jjzk5qUBxjO2PO5dkTyiQ9eaPgAp7fEYKNZchaj1+mCUbmlbAzXKZ
         DAkw==
X-Forwarded-Encrypted: i=1; AJvYcCWX1q5K1Z2AS/gPHCeeis1mFtVrU+VzY0QdcQ3sv9kw1UXZeBnJH9OMarVUEQef8WZ4tn66f1H4F9Bw@vger.kernel.org, AJvYcCWy2GuotWSfbGURLnT3JTOn3mlf7+Fvch0h5asDuqU0kQhonNNHfswTBfTOughs86qDwVOfuVywG6j1SQGzodVkpp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIHyYhW2B55NtMIWrtVqcoefWZtJOAiUxH2ZObOl9Md2UvfuGc
	QrA94iHBy3H/5lrvPgZzlToz7JM+OTJ7bCRi8z7NKAbldI+O7gwXwtY4kYhLmkIVd7RN3bmszFb
	WzWtiJbwp2ko7R+Se0k2PVj4nb0M=
X-Google-Smtp-Source: AGHT+IHZFB+sY5pDHcjuevdTp0+pB+9v3eTbcqOZ7GOuIwMO8dOBjpFyTrQxrDe7UT2luQSZnElAHn+Nbf275OjZxK4=
X-Received: by 2002:a05:6122:1822:b0:509:197b:3e2 with SMTP id
 71dfb90a1353d-50c85594bbemr8691164e0c.11.1728325505854; Mon, 07 Oct 2024
 11:25:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <4ee2e3e1e0e174782bd4d2af44bb6150d24af551.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <4ee2e3e1e0e174782bd4d2af44bb6150d24af551.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:24:39 +0100
Message-ID: <CA+V-a8tFwER5yEnDPqi1Uv3yHJtqQkb7DQEwYAXjRHzEiMwC6Q@mail.gmail.com>
Subject: Re: [PATCH 17/20] arm64: dts: renesas: Use interrupts-extended for
 video decoders
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/ebisu.dtsi                     | 5 ++---
>  .../dts/renesas/r8a77970-eagle-function-expansion.dtso     | 7 +++----
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi           | 5 ++---
>  3 files changed, 7 insertions(+), 10 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index b4e0347d3617a83e..ab8283656660059a 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -434,10 +434,9 @@ video-receiver@70 {
>                 compatible =3D "adi,adv7482";
>                 reg =3D <0x70>;
>
> -               interrupt-parent =3D <&gpio0>;
> +               interrupts-extended =3D <&gpio0 7 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gpio0 17 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-names =3D "intrq1", "intrq2";
> -               interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>,
> -                            <17 IRQ_TYPE_LEVEL_LOW>;
>
>                 ports {
>                         #address-cells =3D <1>;
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansio=
n.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> index 3aa243c5f04c8022..9450d8ac94cbe977 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
> @@ -82,8 +82,7 @@ hdmi-decoder@4c {
>                 compatible =3D "adi,adv7612";
>                 reg =3D <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
>                 reg-names =3D "main", "afe", "rep", "edid", "hdmi", "cp";
> -               interrupt-parent =3D <&gpio3>;
> -               interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio3 2 IRQ_TYPE_LEVEL_LOW>;
>                 default-input =3D <0>;
>
>                 ports {
> @@ -114,8 +113,8 @@ video-receiver@70 {
>                        0x60 0x61 0x62 0x63 0x64 0x65>;
>                 reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repe=
ater",
>                             "infoframe", "cbus", "cec", "sdp", "txa", "tx=
b" ;
> -               interrupt-parent =3D <&gpio3>;
> -               interrupts =3D <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVE=
L_LOW>;
> +               interrupts-extended =3D <&gpio3 3 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gpio3 4 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-names =3D "intrq1", "intrq2";
>
>                 ports {
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 08f4e35c414ebbcf..269cda6fae21de70 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -544,10 +544,9 @@ video-receiver@70 {
>                 reg-names =3D "main", "dpll", "cp", "hdmi", "edid", "repe=
ater",
>                             "infoframe", "cbus", "cec", "sdp", "txa", "tx=
b" ;
>
> -               interrupt-parent =3D <&gpio6>;
> +               interrupts-extended =3D <&gpio6 30 IRQ_TYPE_LEVEL_LOW>,
> +                                     <&gpio6 31 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-names =3D "intrq1", "intrq2";
> -               interrupts =3D <30 IRQ_TYPE_LEVEL_LOW>,
> -                            <31 IRQ_TYPE_LEVEL_LOW>;
>
>                 ports {
>                         #address-cells =3D <1>;
> --
> 2.34.1
>
>

