Return-Path: <linux-renesas-soc+bounces-17785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 879AFACAC54
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8433B189644D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 10:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E6F1DE8B5;
	Mon,  2 Jun 2025 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="S0cEX5zt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7919F101
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Jun 2025 10:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748859435; cv=none; b=fPLe6qwdRzWbSBYx4z5eKMmcmY2rWR2ebEbHmO0jXF4JI91GuiVU/BJ7tSpswqapd/5ABNelBDc/qpGpvlMgEFyYLTV7S+fCVnBbMzPb9ufkFzHRXVUNE7YcpUan21z/Djs/3e10eN7Ef1EKd86WJ61q6R/6NA55XuKGuAr1kJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748859435; c=relaxed/simple;
	bh=pEyblw1ZF05CXEYNgROXAcVImF3tve5gvGba+f35nQg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTMz949XA0W+XPwZIFI6l6c9+VXrxPMwQ1VvGXei+pEiPtpZrKT5rjjVF8+IBi3kgXgvk5J0Aj/3Cksm+NpSyRxE5BmIirl4NOKmtxhzXJnK+BYtBbp+FKHF/b9JQLaNJ1D3AiA44BIAN0GnPevOxTm33RnoBYkqwcOPssMtV9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=S0cEX5zt; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-551fe46934eso4863664e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jun 2025 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1748859432; x=1749464232; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=S0cEX5ztlLK808ycniXZr1H9/H7xNzCtX79FukKmhSGvEttA+EdcE3SDTfdS8Zj0sB
         5SOfwONgUcs2rN/dw/TXR28w9tQhrHu1cTDJ7HkWV3pmX8YSOgCn8aDoExkeGy+fdysi
         KpzUEZ7ueCuTdaVapPm52Kddsv1TxUEqc+JzEgHEUwBOls/FdWq54+kXPBJothd236d5
         s3scgXi0NpyCT+yWPy1esu1uUeZ8h7oo2iYtJCobVBDMZb2ouMDQQw0bSTwn8b26Ttm+
         NTzfB85nlVtY4bL0kVtRuD++jUbb8W2MVlWJ3djL5caCERGjNBYExhS+rfPH7oB38S7L
         5hjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748859432; x=1749464232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGO9sUY+r7vqr6gLOI6qlkiYKXTKtTQAWLD2mIokncE=;
        b=cXhEE8k7nsP/JzT1l+8QGRUtoDqDPNuB15ozv516ZX58qLajX6yxvDVd7mIqvXvmt0
         1VjZLuzIR0ctvK/5z4KEoBQc5eDDnbUH6wCeRV5cTbSQpKLVVpnu89HpthjJvaDrDdQL
         wJGOaIRQMdFhyfBpzZqRsyOvZzQK9Rz1YTRR8cmo910eBt/bVVlcwc26IWWrxdgnhBI/
         T8hiUKDnBlPBf/gSMNbj15COE+ymbv71lGdtyvXISuxNCA7RnM4U79TeR7BkHc1+AfLE
         EGLwjAqslbVytSUpKR/ntgpIOarlr4lJFuZfflgjycrqt9kcGGNMu7KGQe/xgYb5Lmnz
         navw==
X-Forwarded-Encrypted: i=1; AJvYcCWnXYtyaS+FYWNw5J5sZHzKk0EPL1fbS/qO0J35e7UmeYyODmWPj5YoQn7OKFCLQeUE8X99sXLSwk1JsfMeRJky0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5yrQbbFCpcdthmIDjIm62/s1U7q9fsKAoJj2Ofd3cLuafuB+
	1lOWr32TT2imY9uXIXhv+gBYgRv2eXoAF8+/Wg4tzhg2TRKZrWiiUR0JZO0bExBXcItPq4cB+AC
	bULHhEGzNAsDjk1cx9rBrjLhoYTwxP1zv96th0PLkeA==
X-Gm-Gg: ASbGncu06rrATGHix3A5IVclhBG+6fh2EKcTO3oly3M4XfzQnE55Nj4DulDCSi7rKOg
	/2eRPHLPncm4j3EJhG5C4x9hqPm85YSQ2JM8gM8Z13H3ie0EeEJvPH9Rm5tt5E0luoorvG9A8Wz
	AlYurHV9aD5UJ3kOBX2Eu58GYespYd1+kuf8KkTH0F3nvRRee34ucpqxdshtx2jEvz
X-Google-Smtp-Source: AGHT+IE2ScFlgSOO/jzGpylrUkqPYvdmuNlMMD0/AntL/Q/1ICr4QgrhpUxX3vIEoEkKGY8aofftc7B/+e+Cne9Hayk=
X-Received: by 2002:a05:6512:1108:b0:553:2927:9864 with SMTP id
 2adb3069b0e04-5533ba23ab1mr3564157e87.6.1748859432178; Mon, 02 Jun 2025
 03:17:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250530225504.55042-1-marek.vasut+renesas@mailbox.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 2 Jun 2025 12:17:01 +0200
X-Gm-Features: AX0GCFsfGl-iahXc2ZEy1lSOQx3uH8u4YrEEg6MXx4A4twZNi28c07s79G74fwQ
Message-ID: <CAMRc=MckQhB4diiWc+Rtk84PtwaKqr34At3heT0vyAgJ9VA7Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Add optional slot clock to pwrctrl
 driver for PCI slots
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Anand Moon <linux.amoon@gmail.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 12:55=E2=80=AFAM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
>
> Add the ability to enable optional slot clock into the pwrctrl driver.
> This is used to enable slot clock in split-clock topologies, where the
> PCIe host/controller supply and PCIe slot supply are not provided by
> the same clock. The PCIe host/controller clock should be described in
> the controller node as the controller clock, while the slot clock should
> be described in controller bridge/slot subnode.
>
> Example DT snippet:
> &pcicontroller {
>     clocks =3D <&clk_dif 0>;             /* PCIe controller clock */
>
>     pci@0,0 {
>         #address-cells =3D <3>;
>         #size-cells =3D <2>;
>         reg =3D <0x0 0x0 0x0 0x0 0x0>;
>         compatible =3D "pciclass,0604";
>         device_type =3D "pci";
>         clocks =3D <&clk_dif 1>;         /* PCIe slot clock */
>         vpcie3v3-supply =3D <&reg_3p3v>;
>         ranges;
>     };
> };
>
> Example clock topology:
>  ____________                    ____________
> |  PCIe host |                  | PCIe slot  |
> |            |                  |            |
> |    PCIe RX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e TX    |
> |    PCIe TX<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D|>PCI=
e RX    |
> |            |                  |            |
> |   PCIe CLK<|=3D=3D=3D=3D=3D=3D..  ..=3D=3D=3D=3D=3D=3D|>PCIe CLK   |
> '------------'      ||  ||      '------------'
>                     ||  ||
>  ____________       ||  ||
> |  9FGV0441  |      ||  ||
> |            |      ||  ||
> |   CLK DIF0<|=3D=3D=3D=3D=3D=3D''  ||
> |   CLK DIF1<|=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D''
> |   CLK DIF2<|
> |   CLK DIF3<|
> '------------'
>
> Reviewed-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

