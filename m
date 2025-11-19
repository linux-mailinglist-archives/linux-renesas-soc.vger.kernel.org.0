Return-Path: <linux-renesas-soc+bounces-24835-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B2C6F80D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 16:03:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 41DC54F2F9C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Nov 2025 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0820B34251D;
	Wed, 19 Nov 2025 14:50:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6F36402A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563843; cv=none; b=P/49gx0EVOvzRCNbE9d4RXvXMfKdn3EB82Q8QGs5KQuwiKiYHqYxa7Ts92MncGVYJNZ5C7wdlJ3aCWi5zcaly1OJsJ1leRIinjeuUfoZthrnQ6uwrl34B63wN4ZHwJ+umhcPp+kcCoHcuAN2Ww3c40RkA9mEzt2ClDuTWppO++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563843; c=relaxed/simple;
	bh=tN4N7vuK4JJ0rterP05amy6D7j/6Qj9sv/6YKc8hKYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQUwm4G1m23TQrt7PlnZhbGLU1+n3ULKulGshb1FNXK35W+Hv/+tIJ0yCFLtvhoHSLqe26K5eMZ4qY668CtKh3Xe5iwwY6HhRsLlkPEgLRcKuwchiL/HKwYCnQpInGAW9gqVTZ8qMzn8Ew2N8BIX2RcL6bN1pONZ/2Xm5tZ5Ifk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5957753e0efso7116164e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:50:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563840; x=1764168640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
        b=aB/1A0f0q+xdbKlXtVjIhkTefMkdXY/XH3OzjJ3pHw3yTlHFI5wQdZV2QFuJyB/dl3
         3vGIQL6+Nx7OqUOz9qUULWLMKKX2G4AqDAimxcPn72UpD0n0qSrPOI3le6g8hBCM/wcy
         zfp97bp1qGPnwTTmf7ROZjUF0+NRLYtyX97jk5zPscWxgEw4QQvH9NHV7QHngQXSl3b4
         9vxur6LOMMEdPoseVEBeZlgos326Q+d8VLxdI2Nxxjp3gEfM6i4TSaD6a+KRiKFHr5SV
         GvYcpn+wRfV/Mx656JIGdbY3nfNbvy6Pg5gg/21dWjeXJABh/gSG9hkuorPUOcqqjfOh
         jNTA==
X-Forwarded-Encrypted: i=1; AJvYcCUG0uh42ZGATMdqAdl3xORd96PoiWb4Qm+kVUJ7aaTkKz3sCijYJp34xV/L+Tl3MMDUa1MT1V4/HtlcEN/D8GqZCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWLl0vCnPI3o1s9yKJKEIFc7nznbRBb8ouiIA9jksgSWLySdIv
	Fv5j1B0HuQz6MeI6YRNLWgfcBVhuHETJzjN4NyPD3sTzvkJCZ1/tR1jhBQrRBBmc
X-Gm-Gg: ASbGncskI/A9oUnBX/KCTo2BE6F1w5iC6E3MQeizc6IMrWEABhQcNLdjR2dYLAPL+VX
	GG/NHvAHL34uG7XcN7pIIR6cEpXZ7RsCSxT5AjCNCRMkXL06s3Que/hk9Mmx1Cgn0inn27Z5e2p
	yDKl9BvYQpqwuCmt0vGkckK6ZWhX44Bem4i3DV+/yDfRYWUoaO8jADLbp2oZR8VHER5t7ufAi/N
	r9/qNe0rZ2VfH/XfIAdHaKeGnmU5JpDcMcL8ke5rjV3E2Ji7nRrBlZ0iiz/zIqYQTww1U5A3uYJ
	+notE/Yf8GOlEYKoEhDkbGcm9PbuzzC6aeTGhfaU4OLNTgSjvehbjfRb794Ue0Ze6IW0M6CCiWL
	/P92/0ZcwjTG3Mb+emt69dMPjGj1M77R9dCWXMo/rjyUGP73v+Qo0EW2mfre7yV0LKzRq/dKAZt
	hAZ9x9fR9IAhxorx+TM8bpHndWIghMnlwwTVdVU32xeUyxQW5sRQ==
X-Google-Smtp-Source: AGHT+IEyrLj86Gx738Tf0OEEgJxsmQszneEEiFDIxdsDtABhY31Q0QRMMbvvbMjGrb6o19FmtrsOHA==
X-Received: by 2002:a05:6512:114f:b0:595:81e5:7570 with SMTP id 2adb3069b0e04-595841b73d2mr7562796e87.23.1763563839323;
        Wed, 19 Nov 2025 06:50:39 -0800 (PST)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com. [209.85.167.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580400519sm4741740e87.62.2025.11.19.06.50.39
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:50:39 -0800 (PST)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5957f617ff0so7468320e87.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Nov 2025 06:50:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXE86WqHN0O8TycHQjXj6TstpVGFPu+eDC8Y4IfPKsBzQbc149zdFDxejsLXTayPmC+0wwmLWqkLscwdDLR1wJP7Q==@vger.kernel.org
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk> <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: pass struct device to
 init()/exit() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:04=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> As struct plat_stmmacenet_data is not platform_device specific, pass
> a struct device into the init() and exit() methods to allow them to
> become independent of the underlying device.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 12 ++++----
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 14 +++++-----
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  4 +--


>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 +++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--

For sun8i / sunxi,

Acked-by: Chen-Yu Tsai <wens@kernel.org>

>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  12 files changed, 47 insertions(+), 45 deletions(-)

