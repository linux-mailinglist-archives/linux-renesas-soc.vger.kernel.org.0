Return-Path: <linux-renesas-soc+bounces-23606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34EC0A23C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 04:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EF8954E072F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Oct 2025 03:54:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECE4224AED;
	Sun, 26 Oct 2025 03:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="muCG6ZIW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD1182D2
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Oct 2025 03:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761450878; cv=none; b=X7CNEQOstqbmod0yzI0CgBAV9XDGCvWJCIygZMVwqQKtYdGuJx+3zDoe5BOUQ+OxBUlRWxVBmDcc4BhPXxizmA/jUwgT9M4P91RCQg0w9deHvsL55VnENmJrUsqS5yMMopZTHcp+7gism0kW0xjTLpPToi9qc243FJEbMD54izg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761450878; c=relaxed/simple;
	bh=g2hrsp7pYSc3TMauoqecoCt9sBorwJFdn/D9z5eOAJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUaB69u7g9ipEQmhJ2JEIVX2rz6lEav5lsjfqPA1BHIJc2nYLr/3CbehkZvGJHV9Bej/H/lhNXrR4ehVlWvpH+Sq1okP9T1iVXmR/OFm0DbRgqlJu0n+dfJE0TGGdWCwxj02lpD4MvQhwCmBXSCwnakVjqjLOqq4yNA3dwFVEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=muCG6ZIW; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so661359366b.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Oct 2025 20:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1761450875; x=1762055675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTQ9cf8o/wtq1sm9SRIzH1CynBp91izO1iYPl6NL5fg=;
        b=muCG6ZIWEYq03zasG7tywPJfpG27DH15AwzB3w88Y9qiW/t4hmX9xeUNBn+TMtgp9R
         DyJTVlCEv/iJS9Q8VTT5WU+/Ly+gHEBX0Gt7PO6cNky0fHXLM/lkAqdJdBO1WtD9wghX
         gVXkbYdGbEFneuNukzS3k3ZDOa9yrIIk1PsiruHfiigWZGFtNEeO2DvOIE8muvdJBk+F
         MvYRsR7H1YvnqzDTR3d1povZkzmSmerXtdxZrlWrtelsY2lLq2sdXzc1ga22I2XenJPZ
         ry0p7eLKH/eTPvDQK9HYg4zdInmQd74hwDgQdgF0Ov+p+H+K7s4E68Do6jmalCfuxtVj
         4IIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761450875; x=1762055675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTQ9cf8o/wtq1sm9SRIzH1CynBp91izO1iYPl6NL5fg=;
        b=dxEBZBC3GVloi+TVQ60VSrH4Kl2Yq1E38u9XyUnhGp37adORheGHpOpfFwx/sJLZ/u
         OP0TcSmcrF8fB7PaGuYdrZUmy6XIx9WiyKoZpss+T+1rpIDVm9RwImkDfJemgVjw4gXL
         sQ/a5uQkh+e92wf8kMMnW3Bv5eDsNFuBaGNbnz4ugKnN8f6CNdd8VhgRZo0mXwqNm8Zf
         fnxcCFOO06/LOjI+LrWWj0wKVlVSMsVOt9ljxyDPZGAxlTMFP1hEqAf+q63EwbWArx1f
         LqvjpZloAa34hsgS+4OlrZ2tcgVhhZ1tm6jV+Lo2BGzZdG3RcvFkjkrlKGZ5wD2XwcvG
         iLRg==
X-Forwarded-Encrypted: i=1; AJvYcCXaKxt6kmFsLztxqwWzisqCPZgIoUsZAqyOCGneBo6LOvAFRKzDa2lBLLyNmEOKu97uBlBAlQVmEtUrouqKjLXjhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOwOK6PTQNc25k/Vw3YL+XerEfbsClT7tWRmfD2efDabhf7O5n
	ZHOqeX1EMfNog9lmsh0Ewc+g2hUVVnuAPXs1jHWjUqFMynCOLYRR9tE/T9nzjIQL9MmSbsvTSI5
	M23FpReFObxXo83S15ZiupybnETKzq/DGfSzsKXw=
X-Gm-Gg: ASbGncv2uueI6Lm/7l06S+kGSqO6Z9m7Ja3XQCqR3HPyjvINXId9EButdNDDXuxyVia
	vsTOrbMqFXTfTc8RgyNz6/vgWBG/QtRMcr3pvUZzk5dJVeY8gwO6xV0cDgGV16rodaOKOOPAk6M
	5P56KW1lLt8O6D79DZ7KB+/LhAOEmDm1Hx5nWF4G4zKXwZWH+l8vOQCPIhH8zqw9ZJs7TQRfwl1
	EOwI1AhCAWGHruyDoMTiRgjVQTjFknqlrXzlltxzpEBtot9bP9OjC6wNOq8QMPX
X-Google-Smtp-Source: AGHT+IF2+lRvi7mDNU/JIymzliLzIw16APGfZqTPJCYctAtko4LXYFcmoi/L1KJs8634VhqzZUPOYqgG3xi67i7zB7A=
X-Received: by 2002:a17:907:9481:b0:b3c:1bfc:c552 with SMTP id
 a640c23a62f3a-b6d6ffac8e5mr638892066b.42.1761450874010; Sat, 25 Oct 2025
 20:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
 <CAMuHMdWZD1m6t8MnYTA83RV=h9G9o6M3KSZjO32rRjOpz6px+w@mail.gmail.com>
 <bcdc9a86-bda1-4646-9ccc-1dc00a710b44@ideasonboard.com> <CAMuHMdUDuuXncX4sbd6oa+8KcS8x+1Sp-ahmvyh8fRdQt1GqKA@mail.gmail.com>
 <8b984f13-0498-4cc6-a64e-e2b6b147c346@ideasonboard.com> <CABMQnV+z=8-ORRGTjxM=6iP+6+qbJa-N_C0csi8K53wpFwLp_A@mail.gmail.com>
In-Reply-To: <CABMQnV+z=8-ORRGTjxM=6iP+6+qbJa-N_C0csi8K53wpFwLp_A@mail.gmail.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Sun, 26 Oct 2025 12:54:08 +0900
X-Gm-Features: AWmQ_blfwE2EJGb3gpFQC-dypJ-57A6h4oJ5zyEWk7e2ykevzEHoivTUVjag4og
Message-ID: <CABMQnVJu-rVHSYcSU271sVeVvuHN=+h8YOAMkDXW--MWfxguuA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

2025=E5=B9=B410=E6=9C=8826=E6=97=A5(=E6=97=A5) 10:06 Nobuhiro Iwamatsu <iwa=
matsu@nigauri.org>:


> >
> > Indeed, I couldn't find it anywhere either so resorted to phytool.
> >
> > >
> > > Which PHY is actually mounted on the board you have?
> > > Can you inspect it visually?
> >
> > It says LAN8830, plus a couple of other strings.
> >
>
> Yes, this board has a LAN9930 chip.
> Since this chip's PHY_ID is 0x22165X, I believe the PHY driver needs
> to be modified.

I have confirmed that this IC is supported by micrel.c, not microchip.c.

Best regards,
  Nobuhiro


--
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

