Return-Path: <linux-renesas-soc+bounces-32233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCucGEN//GnXQgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:02:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCD54E7ED8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12D99301BA5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DD11FE451;
	Thu,  7 May 2026 12:01:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3D318BB8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 12:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778155284; cv=none; b=VQFfV6QKyMaxyFxtxdMuLOlWj3ZvElfWW2UBtLpwdDpbS3vfKgQ/QbdF6gF3Fe5vP3fDJA3amfsvAIBC30n/dRXv0OGh2PfUSGiVG64upXjYR4pG78g0F6cNZege3EaEx+ZbJZoypv3UTZqeyOsjjOFk8xSodetEIqqGraM6/kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778155284; c=relaxed/simple;
	bh=T26lUs/zZCWaWl3yD133dU+jEapsN5Vpw1J7XoMk44Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OtiSud9K9n/gGAlcQcYsfdhljip2GRXGkS6Rl1q8Why+2v7maJiMSZaTL8Jb2jsOrL5B9/nMo5n9+//dCWKkk7iYB+ZWpXaDRjHLMUwjUZDwKh/MELH7Tbx+22KXGZJwRDvLGzGyxviKv1V5VUKx4V/V0nOTn2VDS9yVh5sbV5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-575602688deso235308e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:01:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778155281; x=1778760081;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTVg2QbVjMu7RTowrSQYkhY+K3Bi7scPf1n5U5IL2+A=;
        b=MPRtuJwYePkwBeuFTHxCzCkNBt8vNtc8AjMbPge05bqhQrsO8hQXjXCVPtNYEwFRXv
         pHUUk1Fppjot3nSwQTHTzMiuGEaWRo0HFq+++iRC4k6TTONxDzv2NsCXyATixkV0sXec
         i6fIORpnhd5VfbPue7QA2iYOmVxIsA9xA2gPalfHXAE2HdYD97SE8oJ//b4+nWcaF98O
         Io7aq4+6iSzIkgt1/dpkOL8YftGGjfxZUBeaADsS2/Xp0j+lfdzQYCla5NVWkAxvvrlw
         ZsWyep+8ISHdIwgR7Uom6QcMCYvmSasiGgJsbuwpw7NUReto34qQpjEQAFnxlZSrTZKC
         sVag==
X-Forwarded-Encrypted: i=1; AFNElJ/rLwhLLH0KSxcuCUg0ji31r1Q/uDRqaM4BRfxjgjdeNZRuCvgw63QShuezgBmBtHB6VO9jIyHc8URFMuN+JqO5aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGi/9LRiTPJFE31hONIc674Mo5qcNbTxlkMDco7TbDQED4kLRi
	PF0nPReFf01yKoZKRAKMykT5wg5UtqhE4B+S79bkIKganUnhUrA7yt9u9OF+ExeLEEk=
X-Gm-Gg: AeBDievaBHgrOeuiK8MUMxin5O26R2zvTfNczra9kg+GLI2qLfJgdWmSuQmbdv5e1xP
	HC3MznWBfgTMBKDfTsdvojoKj+5jY+Hu6EI1cNNh34/u0TSpc3JnaWEPGlAb7pc/5Dg/TmpkrGz
	3+ulQAKJBdoHEpho0dthEKUpriD7GH+V7iibSfukGgRWVMbHrCVvODvQ7dI6gME3l8VB6r+DPmV
	O2+KSiM+9+eJo00u4J09X+2R5OvKo5NiZYXO1TIV/ULv8fs3x06p4sF56mt+v8MP8SgL8GA99kI
	rCLm8WuZqpnERGwNJmDVi8VN1Ac0A0EYGUCZE8rLtsTe+eJxRAxYAp4TZZh+lA8YWC4HUHqrc0B
	DFdLCuze7chIEoKMISeZi19PkfTVzIf5QfMH9tcDx4K34qw4WIjhCISB3upgPzAVaUwCgBhOPCN
	bf9tBSB59zOB3ENEyB3FUqzgWF1p05w4Av8VBrA9O4y4XRntBhhKEB4GV7tBF4Vu2tv/15qxkNz
	Jo1MpXfOcFRqg==
X-Received: by 2002:a05:6122:d15:b0:56d:7b2e:89a1 with SMTP id 71dfb90a1353d-57559538111mr3582009e0c.4.1778155280527;
        Thu, 07 May 2026 05:01:20 -0700 (PDT)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95ce0894dc8sm10595438241.2.2026.05.07.05.01.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 05:01:19 -0700 (PDT)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-575602688deso235255e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 May 2026 05:01:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+b0G7QNgExKAlolVuvy24TDTeOWBm/3qSMs01pvVWnXfW3RlYmgVhO8i4oceZP7dpfuipa+i3PZSsW9Mxq6FphJw==@vger.kernel.org
X-Received: by 2002:a05:6122:3209:b0:56f:7300:37c9 with SMTP id
 71dfb90a1353d-575596aac1fmr3878971e0c.10.1778155276818; Thu, 07 May 2026
 05:01:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430125342.439755-1-biju.das.jz@bp.renesas.com> <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430125342.439755-6-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 14:01:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
X-Gm-Features: AVHnY4KZNtx0X6b3me6zkJlGEIJEG7fMv60j1sOJQihhPmGmiq134B3u5_qjEhI
Message-ID: <CAMuHMdW_qKgNjWD_ktPF==M6SGyhdu8pEvbyO1gt3_B_Cep9dQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl
 configuration for ETH0
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: DCCD54E7ED8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-32233-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.7:email];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Biju,

On Thu, 30 Apr 2026 at 14:53, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add pin control configuration for the ETH0 Ethernet interface on the
> RZ/G3L SMARC SoM board and also enable hotplug support.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3:
>  * Split from patch#6
>  * Added hotplug support.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi

> @@ -52,3 +55,32 @@ phy0: ethernet-phy@7 {
>                 txd3-skew-psec = <0>;
>         };
>  };
> +
> +&pinctrl {
> +       eth0_pins: eth0 {
> +               txc {
> +                       pinmux = <RZG3L_PORT_PINMUX(B, 1, 1)>;  /* ETH0_TXC_REF_CLK */
> +                       power-source = <1800>;
> +                       output-enable;
> +                       drive-strength-microamp = <5200>;
> +               };
> +
> +               ctrl {
> +                       pinmux = <RZG3L_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +                                <RZG3L_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +                                <RZG3L_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR */
> +                                <RZG3L_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                                <RZG3L_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 6, 1)>, /* RXD0 */

I will sort in ascending order while applying.

> +                                <RZG3L_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                                <RZG3L_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                                <RZG3L_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                                <RZG3L_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                                <RZG3L_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                                <RZG3L_PORT_PINMUX(B, 2, 1)>, /* TXD0 */

Likewise.

> +                                <RZG3L_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +                                power-source = <1800>;
> +               };
> +       };
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

