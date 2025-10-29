Return-Path: <linux-renesas-soc+bounces-23854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A33BC1B904
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1C6B466E94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A8CD2641C6;
	Wed, 29 Oct 2025 14:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P2g8vCBS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736F4261B8A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747316; cv=none; b=ZHFE0fqZvOzwvnF75R//z7keTXoNIJgRTsvg/Ru7ZjcWg6E0SL5HXkcAa+LNPGeStp7Ps84TT8N8wBUNGrMznTgoZ4hLc4kPzniU04vhErtQeKC6dcboSmgADkQkj/rwKOFpfPopb1L0vNhzZAfzT2xXG1b+uI97POtfDtkghkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747316; c=relaxed/simple;
	bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqAqgc/vpCortbcwwEVANzlazREfcbL+2eWSVvf1ReFdSJlbWCi/d3tQYMtwvd0SEFyEN3QT1CcKLeI29/SHATcjlJKMB2KMLAyUQy1bz4wHW6kM2TgCCTeFsABqLImvBLLbZLnxEnwdCU8Ft61kfwKlrf9Pt/6A3qxQca6uaVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P2g8vCBS; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-592f5736693so7756135e87.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761747312; x=1762352112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
        b=P2g8vCBSKm9qQSx8QMCRipO+Xunm+j0kPjkxsG64Pa2AOUwbg8kkHaKAGR0ysqs4ZE
         7nCpNOO4ghqFN+9+aZtZvEolZbEwDWhY72CBEXuKZuzIe0kcLpkrDGivAWWaJt/cjixC
         ChVGaU/exsl35QMJWjWHqe8BgtmKJTK0NMiFpH2nW91PFrzqGRYdkjTWIq65qchYOGQD
         hVihrAC+CEAHE/utWhWqNk6lzGVoNW/3hlKFs1oUxQAU+mAzk8o8epDhvTu4zMsPmzNA
         qrPd4IcYiE8TK7qOQa6pyi5mP84Nx8R5M3toFhZ9450iSivFZQrPlt6lnKZd98d8Zpbo
         DFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761747312; x=1762352112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnGN5D18R/9fVPC4aATiOOBzgu+WBuLqDytyaFyTYec=;
        b=keMfR4j3l9sT/5PstS75NOuK5GAVQkqi+jO4p7RiApDN/CbAhUAEV8n+BmaNzR4S+Q
         5eH9ofRzZxdB07PVkV+91C4iXaJbjDTIRz2m35pZVA8HrsLqfH5HjCDuTODFBjdxKspw
         s60tM27g35FyqF206hAPpJ76u6urwC40dWzUyX38ECHKM/AUMDvlpX6oRoa9yFKXixrs
         ImjXePQPnRs/gOtBFHbE+oH39lAq06+Qqtn3K01R6NbVEE2zLpJbVmU3CoEbMQqyZVbf
         frOjQymIwaq+ktp13KybylRSQOu995xPcKId8aZjNCXLegTTmLsMwF1j/aQuhUBrd8Z6
         4hLw==
X-Forwarded-Encrypted: i=1; AJvYcCWIdz+AwEpFfUGebDDtLKiVSb7hqZRFZ6oUH7NkGZ1OtAoudCA9hyRxY8vSXrRd/tXDMalhNX81NTEUehvgj68nlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfLsr3oAZxyxBZO/Vrz4387N5CDXQZgDgGCaEgRp1IEgU4++b
	KAsT7OGZ8IXEOSqb+m9lp9My/OjJIZf2nSGsMNd9UMCjbjPU1Kiq8abzFnswryaUEMLcWf/hyms
	odZYStedKYcsUB3Lw8vJ5Wzs7e0PmnXioUNuzfZNguw==
X-Gm-Gg: ASbGnctERhB4XwkudR5eHOKfTxROBhGw9RgEzKMM3Rld2v4C72XQnuScldcGsxYzqxg
	vap3aagQpVq+ozSudwzFMiN7iClN3bIpFv/VtzCoiIIligzq2EJQYdgOSweLC+NVzXACAp3g1bd
	803Rsf9887vlnJeGjY/y2m9j25wkbI6LPEMgqkJlgfhFllCTfnwFusGT72ZAJGymfzJ2/4FM9h1
	HLvkrylweVZc03KMgEVHUBAEt9X060RV4Kpm2hzq66OJFb8SkGF9Zclg6ZzFHUMj3UC9sZo6ky9
	NomcUA==
X-Google-Smtp-Source: AGHT+IFHbNWWVxA87snhrR4IbvJu5TGV5/GUfJgAIFivqMT+b8PLCXPg6xBSIPiXG/dy8RZjJuiqgOtncZYWj0XE3mk=
X-Received: by 2002:a05:6512:4027:b0:579:fbe5:447b with SMTP id
 2adb3069b0e04-59412877a64mr997730e87.25.1761747312519; Wed, 29 Oct 2025
 07:15:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027123601.77216-1-herve.codina@bootlin.com>
In-Reply-To: <20251027123601.77216-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Oct 2025 15:14:59 +0100
X-Gm-Features: AWmQ_bnA7g7AcaUJgpDisQ6qYyEHOuq4LuFcqR2x-CFiQFCGVVARLA-FUYgDIHk
Message-ID: <CACRpkdZMj84AJu1ZgDLin1Ef1JaBRHsevB2auTFvn4h3M66yGw@mail.gmail.com>
Subject: Re: [PATCH v6 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Serge Semin <fancer.lancer@gmail.com>, 
	Phil Edworthy <phil.edworthy@renesas.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 1:36=E2=80=AFPM Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:

> This series adds support for GPIO and GPIO IRQ mux available in the
> RZ/N1 SoCs.

I think I sent some review tag at some point?

Anyways, here is another one:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

