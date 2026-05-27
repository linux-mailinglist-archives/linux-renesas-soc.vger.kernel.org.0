Return-Path: <linux-renesas-soc+bounces-33236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAy0IpsyF2rd7wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 20:06:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B0C5E8AD2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 20:06:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 72A9A301911D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F14611CA;
	Wed, 27 May 2026 18:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oSHLb0Qk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B92C413D69
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 18:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905176; cv=pass; b=nnCaqYyGjdQnicYd603PdsRCDOzcUgs5xyxZvrGQvPp9/SwgrR8yDaHgFtidWyKCLY0upgLyehu2OgLlNYwreukVwpigL7hAI2JCTKNa1DcQbSeVhVzGRfM52hMqpv2LCTKlVHLwBKMyInPLHz2Q7wrQteF5zz+Uk4MEh1QSLPo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905176; c=relaxed/simple;
	bh=QMQJGWOuylEu/q2KAHEDFT8dECfH7P2/iN9dTZERWUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9O2TKp9JCzIi5PM07fV4OEUEqT23ZSu+AT2BEULXSaQaSv/wzlaoIuz6YEU/05guQGT5bmBZJlzCoyraXRKpJfQDPb1aKEVKchOtjjKhDhqhI9qcBDNYFQrhMWO8ebEYP+R+OCN7jVy/Q2Beej1k1aKPzRqvfK54MCxgCPRlHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oSHLb0Qk; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so8494018f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 May 2026 11:06:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779905173; cv=none;
        d=google.com; s=arc-20240605;
        b=XrURo1KFWYVF3tw3+8bDTT4c8mojmcMJ9JfNJPgsueZzeIpKqzjTBGKBMVn/eFSoOv
         5FN6WD1Fa+kXikroXwbVE9z66EF0H+IglfTi3MflwzBOzoYWr36ebmtFBGo5Yt5ecKZF
         nx+6lBL9irm4XaxreP8Uku/UVW+uheehGkpJP+4bxgxPZfkOIYeEds5Nu1ZDF5vvUmn+
         TfQhG2Nn9YnMu3R8zxGKz/hDEOBgrZMiRzHiLDKb2Wi6fTbNvaSDsTyc061A8NA95NcB
         nSU66dyFHKOTTRowFsHyFhmQFhEvDbgoAJdHQLaHynA+DGT7KKzi4vuion/7Y0NwrbdS
         Onww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        fh=oPScq3rQZF7B9Nkf3moDCmeeNBhkawf0RgZhPLT2OYQ=;
        b=JquURcurH93e/oBiZ5fnizFSRuHpv9r39wXetwZ5t20MBTOlgsjocXBjiUNn05Q+G4
         9U0DXnvIAeUmBNK9e2HJIrdzuECD3J3zNup3t3ZXWBA5jBeYuUn6aAX97tOauD7f6+71
         gr9UdqKGasEfGD+PK3ZEqiDVcSddes7PLR/NXBtcp2t7mQImp7cSLrlEYLFv4jJhYezP
         k5CU+Tiz+4Sf8BG5ffHdfGtatMx1lpIQ0PFouxlp3pOLBuWdnNYITMXNPLy9mR6E413A
         0yNUkK8Qsc8w4zQ6HVgacjHvgng0zHpO0Tu9KQ9tGg5i88pz1J/KDthY4WSpvcg3KRNr
         adxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779905173; x=1780509973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        b=oSHLb0Qk7smyTf8PLUyw+fZqLnx8NMR6c8TzimiyufoPfX0+yhidViPZYuwyKFAUQh
         SMQS0x20NXpvceOmgjJZ8eouj0g1HtBErGOfoyO97d5ohN2AyGlC7ocFlAKu0X0WJdKE
         5TK9m9k6chlZSKR8LU9UaWWk5NHxEcBGvKCHFnpQ/FJnUtrw/Fs4Tr//yMFBe8NpDiR+
         vL2RuLvpNs+U6NKn2zkv5AxVtJq7NszseIBf1hUYkqeNfj6zIAD6CcNoYwwbvKrRpzkg
         rABT2LVZg2tdOnprD1LjIgK3CcUTYGufdhwpJ1w2aNYAAGc0BW310/T1FQ8ABNw0qYSM
         T2Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905173; x=1780509973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U8QoHGAdus2wn6B1doGtbB/NA8r9fzf3vojzM1uxBD8=;
        b=qVP3Z6QatJOzmc9FoL66Via05hWq4so5XcSt1FlmR3QzsifwJGjMuXfCDFe+3vvjzB
         wheFjuRG+zYdygPZnjAJAmLD2MVZLAPOHNZKpxJsrfgtpP1X/NVvAyj6yVTqNjRd/RU1
         UkGVbfMVFe446YA86rDcHWljUTl/V9eDGahDPH6Rmqj9l3+1dhrHf006IzvS1bRA/dmg
         kzLCSFnxSFdWv+JSxBtA8DoMEsVqFhUx0azzybJNykeFv4yziuQ6ZJ3JBjCJHgpEuFWf
         86D3ZmgUoKLsBjBVBkqmy8iwtnXNWtTYHLbp11ErOSD49E7GbQok0QLsYUBhv7NcKQQz
         jmjA==
X-Forwarded-Encrypted: i=1; AFNElJ8Tq+GWG5zT2c3UKyCUwyZfAWQEUEsmWhL1b4Hey8m504AbK3nnW6JuPGHnGpLNwIQRK+k8KqjiAft7ZvoM5ifiBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfQnaYJmAXXy2WhJYCYjdbJIxiDqU+69PnLmAFiEFbmTp4+VE4
	YwbYMSRn+pnxWKKp385c9SASYyTyMF6d89OIa/FHnzNmpOLaTcJTurIAi3/QNkHf/Zk5R7E40E2
	b2SATg9+cIKYdrpwNbjtsjTiN5ifbzvU=
X-Gm-Gg: Acq92OHICb6xCO789LASyef7i93Eu1WHteqSO5ukw8a5RunxnZ+B7g2nUL0Tffs14bA
	Ib+MAULxJhUOtv0L2Ildef3XCJSRexNhYt3KdUNccipvg2YQTV5K6mxPZrAJr+IUEKXipH5TE04
	Wb1OMJUKZmUjzxYKxo1/rA2vr/W8b+/OMrWbbWpuNM6dwsfqPsVlvV6DdyHRMlnwMpIXARRPF3q
	pBJxMGv0ye3mXcuOXdRgNzSSGw2fWm3jIOVOq2XgIunx8zZdL7oiA3f7uNQQAT8qB7RvdntAu1j
	eRHETdXae2xHvk6ZqSaPKqJRyl0xqa/u6aeyFkAK7ARY40N+2QH4Bcb2jFVlmIIVisPCmGU=
X-Received: by 2002:a05:6000:41e4:b0:45e:73a1:8d04 with SMTP id
 ffacd0b85a97d-45eb30cfd63mr37237429f8f.1.1779905172629; Wed, 27 May 2026
 11:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 May 2026 19:05:45 +0100
X-Gm-Features: AVHnY4JlerP068n-ZleAXKIVyTpaQ3MmDXw0dlAjg9eNr3LEYVQDkiCtV8ZKahk
Message-ID: <CA+V-a8vhCqdVf4iAusGj3rtCjkazAFqQJ4cwcnEGS0qK-EnVVw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33236-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,bp.renesas.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 19B0C5E8AD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Fabrizio,

Thank you for the patch.

On Thu, May 14, 2026 at 10:02=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
>
> The HW user manual for the Renesas RZ/T2H and the RZ/N2H states
> that for SDR104, SDR50, and HS200 to work properly the eMMC/SDHI
> interface pins have to be configured as specified below:
> * SDn_CLK pin - drive strength: Ultra High, slew rate: Fast
> * Other SDn_* pins: drive strength: High, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> HS DDR and DDR50 are currently not supported, and for every
> other bus mode the eMMC/SDHI interface pins should be configured
> as specified below:
> * SDn_CLK pin - drive strength: High, slew rate: Fast
> * Other SDn_* pins: drive strength: Middle, slew rate: Fast,
>   Schmitt trigger: disabled (not applicable to SDn_RST pins).
>
> Adjust the pin definitions accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * Take into account the settings for lower speed modes
>
>  .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 147 ++++++++++++++++--
>  1 file changed, 136 insertions(+), 11 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch=
/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> index f87c2492f414..46f4aaac0478 100644
> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> @@ -275,12 +275,63 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
>                                  <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
>                                  <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>
> -               ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> -                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0=
_RST# */
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +               };
> +       };
> +
> +       sdhi0_emmc_pins_uhs: sd0-emmc-group-uhs {
This needs to be sd0-emmc-uhs-group and to keep it consistent, we can
rename sdhi0_emmc_pins_uhs to sdhi0_emmc_uhs_pins (and same for
below). Since Geert has already reviewed, perhaps this can be fixed up
while applying.

Rest LGTM,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* S=
D0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0=
_DATA3 */
> +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0=
_DATA4 */
> +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0=
_DATA5 */
> +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0=
_DATA6 */
> +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0=
_DATA7 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               cmd-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>; /* S=
D0_CMD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               rst-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>         };
>
> @@ -299,12 +350,49 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* S=
D0_CLK */
> -                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
>                                  <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +       };
> +
> +       sdhi0_sd_pins_uhs: sd0-sd-group-uhs {
> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* S=
D0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>; /* SD0=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>; /* S=
D0_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               ctrl-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> +                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>; /* SD0=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>
> @@ -323,12 +411,49 @@ data-pins {
>                                  <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
>                                  <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
>                                  <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +               };
> +
> +               ctrl-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
> +                                <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <5000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +       };
> +
> +       sdhi1_pins_uhs: sd1-group-uhs {
> +               data-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* S=
D1_DATA0 */
> +                                <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1=
_DATA1 */
> +                                <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1=
_DATA2 */
> +                                <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1=
_DATA3 */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
> +               };
> +
> +               clk-pins {
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>; /* S=
D1_CLK */
> +                       drive-strength-microamp =3D <11800>;
> +                       slew-rate =3D <1>;
>                 };
>
>                 ctrl-pins {
> -                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* S=
D1_CLK */
> -                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1=
_CMD */
> +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
>                                  <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1=
_CD */
> +                       drive-strength-microamp =3D <9000>;
> +                       slew-rate =3D <1>;
> +                       input-schmitt-disable;
>                 };
>         };
>  };
> @@ -342,7 +467,7 @@ &sci0 {
>  #if SD0_EMMC
>  &sdhi0 {
>         pinctrl-0 =3D <&sdhi0_emmc_pins>;
> -       pinctrl-1 =3D <&sdhi0_emmc_pins>;
> +       pinctrl-1 =3D <&sdhi0_emmc_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&reg_1p8v>;
> @@ -357,7 +482,7 @@ &sdhi0 {
>  #if SD0_SD
>  &sdhi0 {
>         pinctrl-0 =3D <&sdhi0_sd_pins>;
> -       pinctrl-1 =3D <&sdhi0_sd_pins>;
> +       pinctrl-1 =3D <&sdhi0_sd_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vqmmc_sdhi0>;
> @@ -372,7 +497,7 @@ &sdhi0 {
>  #if SD1_MICRO_SD
>  &sdhi1 {
>         pinctrl-0 =3D <&sdhi1_pins>;
> -       pinctrl-1 =3D <&sdhi1_pins>;
> +       pinctrl-1 =3D <&sdhi1_pins_uhs>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vccq_sdhi1>;
> --
> 2.34.1
>
>

