Return-Path: <linux-renesas-soc+bounces-23605-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FDC0A192
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 02:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 043324E2B2F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 01:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291211D54FA;
	Sun, 26 Oct 2025 01:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="u/exQROQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D52B661
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Oct 2025 01:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761440826; cv=none; b=XIPyKmDID9bqJhVEY9/rpc8onCkWwaounC2407RMJ++ouYn91i/eRMTXHhZe9RARnY9AOuePROUg8fzZGNsQ50QJpJb6G+vfNTZvnGC8rRIm3jY/WqpolN6b2LBBTBkNzQRQXp0rMAMFsSk2EtM/E6/k0DYmatqKQQHkyYPuEnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761440826; c=relaxed/simple;
	bh=h1BWNVuiQqVThhPkqmgYTLIaAh0PxR2NeIciEEycIA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W3rvAsORFKavZ7QOsbZH1N3NorMAx6o0bG3l+bAesYdS5bypNvdVN4LY04ESqsiF9UXjGDW6togcRFfMZ2nbrYt+cEhHeRJuVl+LgPpbp8YOri9Hfe2icFfWzECf/WzFCjmsP4+TRMbFax2V0ZYLXF45L3Xk++15a7X2SSAxRPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=u/exQROQ; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63bad3cd668so6387619a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Oct 2025 18:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1761440822; x=1762045622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ61RpudmfZrh/HJbvgg8/1ZTRvQLwFHMelmv5U31PQ=;
        b=u/exQROQohikUYw1lGsuL3/C2DIsgF62hp/haB20D3gLhr7fbZoTr6fl5HiZUdQAm/
         yEtwF3uFraCzGWQ5AYxUEPUk79Kdd6xZ7Eah+jXx7uYseYVIEvIY1Q3AsRqyCA4T3aIf
         ++x8G4ir4yrkCPaccRDvpmTNhBItNgNulWbjfGCxb1xlvxkwfiJvHD7RGZYu9r79S5uG
         BFwl2SIEbI43nBLo3Hb+6zlXQjUnUgDG0nWxCL/hJaKoe/KXFlFGvo7tnHilXwXK5K/M
         RJ/6PoFyYvqMrR6Td0IeJDI2+xtTC8NUI5eb95EgX3W1nAjJCjDpV8nLi33CdC6azwn8
         qq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761440822; x=1762045622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HJ61RpudmfZrh/HJbvgg8/1ZTRvQLwFHMelmv5U31PQ=;
        b=EI3qeKI128TMM1D/S9/IBpNCaqe0RLw6xkyrIjDhkrd/xLGs/imQqgVE17UojFn08J
         Un7rztM1qiKOozlO3Znkk6Z3h2a2R6gQJTlFVyx7OCk63pCmty2h9BR86e5jOGrDPdg/
         D+fu0+IWzYCQsQEAUUKYOZoiUjdjY+9Tld+YvcJK/9Ptlp2PesUxIsHxwYBDfy88BIaP
         7TCKdPvtUZ9NjMKaR4aSrAaUrl9waWmQblKfpqcloH1EAyo5MqbJ+PDEXbDUwIJ+kIGp
         anztrPUFXt/0LR0pTlxS4ZUK9jc3+ZT9j493t/E5sPtzAerkDjYAuig31EFmcpBu6fqh
         BIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwcUzN7YJBCVQRY3xuloXLSpdgBiEpfSe5HHOsAyBpLI7TvDxoD6XuSbytiRblDw+b9LZrcMEX7o9FMP5A9s9APw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk6cRKW9yIJ3CqCTCp07xoXnRFa93EoNol9XkmFP1kfBj1wP7k
	CWiJAB5IjsuSBU75oBicImjLR1aQkk/gfMym1Efnfrf7Mh1SNPdVNYUl8i5QCVAFiEpjLMVNJzO
	yXaXjzK1qLN8L8Tz2ZOhCjMSOIcBARhDjm6R121iU7DStMTo6P353
X-Gm-Gg: ASbGncv9Q6Z9t+JX5R4b3+VXNFeZ5QXIamncMpgKsBUfiWLJZo8Q44k6mDqHXARTdGc
	/iIKHGvaKFVqeQh0ZwAzAQWEr9dNnpY9p2ljbKwEZL+GDuE24oIrhW4CrCoaLg3fmVCGRpv43Ux
	hM4AZxOI00k95c2iPujxObASlMdAu6gnn9TbKWrHsT9vz1wWQiJuRt3DlEA+fZ3C3wRu/7hrbky
	zadpJo0fwE9B/E9oZ2L4bTwW1lPt/THyUf748D4BM4rEze3LcjXYBrzzePHIsF+
X-Google-Smtp-Source: AGHT+IENhmql/pNlk0Cy8pruLhuU9WbGD4F06YxuTssPEuvz4gMG6F2ON9DfPG/aPIMA/9whw/Uc2noxL2TdxgjPjag=
X-Received: by 2002:a05:6402:2787:b0:63b:efa7:b0a9 with SMTP id
 4fb4d7f45d1cf-63c1f633e3dmr31828969a12.9.1761440821097; Sat, 25 Oct 2025
 18:07:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
 <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com> <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
 <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com>
In-Reply-To: <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sun, 26 Oct 2025 10:06:35 +0900
X-Gm-Features: AWmQ_bkvr4ujmOFdrAKUAnfTnu6JFNfmGrsL4ZHx1rZI0CaBJutKAJ8Pr6Jq1lw
Message-ID: <CABMQnV+z=8-ORRGTjxM=6iP+6+qbJa-N_C0csi8K53wpFwLp_A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I was late in noticing this and the Kakip patch.
And Dan, thank for your patch!

2025=E5=B9=B410=E6=9C=8816=E6=97=A5(=E6=9C=A8) 19:51 Dan Scally <dan.scally=
@ideasonboard.com>:
>
> Hi Geert
>
> On 16/10/2025 11:40, Geert Uytterhoeven wrote:
> > Hi Dan,
> >
> > On Thu, 16 Oct 2025 at 12:23, Dan Scally <dan.scally@ideasonboard.com> =
wrote:
> >> On 15/10/2025 13:32, Geert Uytterhoeven wrote:
> >>> On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.=
com> wrote:
> >>>> Enable the eth0 node and define its phy.
> >>>>
> >>>> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> >>>
> >>>> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> >>>> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> >>>> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
> >>>>           };
> >>>>    };
> >>>>
> >>>> +&eth0 {
> >>>> +       pinctrl-0 =3D <&eth0_pins>;
> >>>> +       pinctrl-names =3D "default";
> >>>> +       phy-handle =3D <&phy3>;
> >>>> +       phy-mode =3D "rgmii-id";
> >>>> +       status =3D "okay";
> >>>> +};
> >>>> +
> >>>> +&mdio0 {
> >>>> +       phy3: ethernet-phy@3 {
> >>>> +               compatible =3D "ethernet-phy-id0022.1640", "ethernet=
-phy-ieee802.3-c22";
> >>>
> >>> The first compatible value corresponds to a Micrel KSZ9031 Ethernet
> >>> PHY, but according to the block diagram and the picture in the Kakip
> >>> H/W Quick Reference, the board has a Microchip LAN8830 instead?
> >>
> >> Ah, my bad...I thought it was the same as the EVK so I copied from the=
re. I think then that this
> >> should be "ethernet-phy-id0022.1652" (based on reading PHY registers 2=
 and 3 with phytool) and the
> >> other properties look to be KSZ9031 specific so I'll drop them and re-=
send
> >
> > Hmm, include/linux/micrel_phy.h has:
> >
> >      #define PHY_ID_LAN8841          0x00221650
> >
> > drivers/net/phy/microchip.c has:
> >
> >      .phy_id         =3D 0x0007c132,
> >      [...]
> >      .name           =3D "Microchip LAN88xx",
> >
> > I haven't found the ID in the LAN8830 datasheet yet, it seems to be
> > buried deep...
>
> Indeed, I couldn't find it anywhere either so resorted to phytool.
>
> >
> > Which PHY is actually mounted on the board you have?
> > Can you inspect it visually?
>
> It says LAN8830, plus a couple of other strings.
>

Yes, this board has a LAN9930 chip.
Since this chip's PHY_ID is 0x22165X, I believe the PHY driver needs
to be modified.

Best regards,
  Nobuhiro

--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

