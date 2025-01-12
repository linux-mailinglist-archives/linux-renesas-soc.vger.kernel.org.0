Return-Path: <linux-renesas-soc+bounces-12069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 012FDA0AB2F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2025 18:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F763A3BF0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jan 2025 17:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC0231BEF8B;
	Sun, 12 Jan 2025 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZEju9V+R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411BF1BEF77;
	Sun, 12 Jan 2025 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736701878; cv=none; b=EADJ0H63g2ygIs+mgn4fNTkFtjg5iwV+IvMdZqkwrXm4vJDxxfGHIfhi8C4JoayZINBjimdt1QVze2fRKj/nQ1773TUYjQP10o6ND+FCPod2LPfLqjccJn591wH3/UiBKXGIdDow55RInrBuQPL1IvgWKCfLzzqsBCLawzSP4Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736701878; c=relaxed/simple;
	bh=s7QShYDcJOa5wKM/u3/GrKZBSCoE2UPrTk0RBhJkY88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O/cj+rjKpUvu+EnAycZx8gJuRAIquevfmZ3XeJjc12vfQkI2dOljo0sxc+gHtojHAP45++QEuH19oEuxeV65TzDk7Q1zFgZ49xB6fIDz8IvzzoVkxdM5JhrUhk1cAKwWo+Jcq9vAi9AECdyS3tMgw9Pl+UVlB+E8lp7CBp0Iftw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZEju9V+R; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2a7ccb2c618so2064542fac.2;
        Sun, 12 Jan 2025 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736701876; x=1737306676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BRSvG4lHDviRuzjJRGYuKFbYzwOqYOzJbZ32m62ocNE=;
        b=ZEju9V+RTzN8gOfhAKwl/HtzQF8S8YxrQtXMxQNIYlzwOn1TMXCDhoH1y1oiJeWQha
         in/ZA0kXqV1Dn8fh0dj7G9j4RcVkMhtFxbiyLjtf90bpfzprvo9JlGxoTwyX3A/GwpTs
         9G9fKSQU11rVeoBaMgRrBFQRAcRhyF61hqGCoKkoXc+Z7CDfXcx51JYbKwUwl8Ipktbb
         hIcmyhXYSZOkgIfQsqN5TWyTDTrte27G7PvFZqgX1Ot7/ojIOyKz8vrxUe6oeNMBG5ku
         pIELWd80sJIbxjV/rrNn3+E0Xl8vgX7r7OD3PS+1Z0GnvkREcbZJm+7YxZn5NGNVqtvb
         gsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736701876; x=1737306676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BRSvG4lHDviRuzjJRGYuKFbYzwOqYOzJbZ32m62ocNE=;
        b=q4atTzsXiON2mDgWV++Nkqca2utwdNsGian17OdYZJWiP7uK0768pLpkmZDhw4OGfU
         rbnsr4/kaQq0x1ViN+fvA/GV0INUjxitvRAdGD8wCm7T7kEdxtqRJsEzxxMXcQfEUcya
         KKHAYjISPMS1q0IW8I165HyIAJtMzWpfXVCA3FOQ239YYQpuTiehqVE38iYYkeN+q82I
         qXppN9AcoYESjBZ2FmQPW3qTrfIV7Mxji99Nc3jHRYEaCiRTKF9bYL4nisWWttWdkubJ
         ab3IKqosS/vKe3reSC1SUC/uoeMukSZN0W+/b0PjAdLsB7CsKaeeX4QS+0J7UNLDDdcx
         g4xg==
X-Forwarded-Encrypted: i=1; AJvYcCUCXEsq+XqFXOdEk+if3W6gDBGvM9QsaIKJHv6eOsI47Rx3oYoQNCk4NtRu6eAK3SJoLx5lhW1Mo5EhVzX1V4QTi2M=@vger.kernel.org, AJvYcCX38Zalm3GwnvNGQY4Zl7w4fr7xuv1P7OoPwPdDvTrZHL/3zJzzmiAV6ttEEJhtjPG/7NpK39UBRJb+@vger.kernel.org, AJvYcCXAC1nFqJV2u/ZUDYu3Ti5rJAT9Xae4eDjIyxhNMzqXomtmhGR+Jc61082YiHEC4jitb+CyImhB3mlN@vger.kernel.org, AJvYcCXcKJ/I+5ACSdhLOdglH38X5kBU6Kg+ObqztHWPhOvuxpSxFMAYMN8yt9hV+XvNmUMqshbhpf0ife0FsRc=@vger.kernel.org, AJvYcCXwiMJB4be3fjOL1DU8iYLfappMX43ZBjsOPi7nPEBAqPiv06jcP92pmX5+mpjbMPE5smfEUASmeuvhK/CX@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUU5JfRFvIGJe4hx2N/wC2FPIFHuinOP7seJ3s37W2b6OM3KL
	oaqoWh7FlRwtD1xrcvqFajdenW3qEYw6qrSYhZYRY1Y8T0gh1xEZUtJB1AQhsK+x0keX65ZkhhY
	inVfCwlmzvFMDgLW805cEbmwvSxi4rCTjKNM=
X-Gm-Gg: ASbGncuulg8uzoWkTfyzVk6e+lsbNwNzQRpLRUAZr373WtNUauy8g5w7RLtQcKJw9vT
	d+BTfnRz1MpBP/UqYR4bGf7v6F1lNuPgKbeqJn+U=
X-Google-Smtp-Source: AGHT+IENGjLXxXcSGe+w7tY3R64tOX7yK5WBTBwurxfDdtVFwVvG/FRtTErahZqTGTD6G89aj5oqyZiB1L1vqwlTv1w=
X-Received: by 2002:a05:6870:ad84:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2aa0690e4f6mr10712332fac.27.1736701876276; Sun, 12 Jan 2025
 09:11:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 12 Jan 2025 11:11:04 -0600
X-Gm-Features: AbW1kvbXjyqTnf9gPwBQ9ZLkKzxPws-DMkCbBAzJp--cshKBewoVPRLg0dMWqYE
Message-ID: <CABb+yY0sgg6-zF-0shQbcZ=TqxYGDO=S847WpLGFcF3Xh9f2Nw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Justin Chen <justin.chen@broadcom.com>, 
	Al Cooper <alcooperx@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Florian Fainelli <f.fainelli@gmail.com>, 
	Benjamin Bara <benjamin.bara@skidata.com>, Bjorn Andersson <andersson@kernel.org>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tianping Fang <tianping.fang@mediatek.com>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 7:10=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>  .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----
>  .../devicetree/bindings/usb/cypress,hx3.yaml  | 24 +++++------
>  .../devicetree/bindings/usb/dwc2.yaml         |  4 +-
>  .../devicetree/bindings/usb/fcs,fsa4480.yaml  | 20 +++++-----
>  .../bindings/usb/intel,keembay-dwc3.yaml      | 30 +++++++-------
>  .../devicetree/bindings/usb/ite,it5205.yaml   | 18 ++++-----
>  .../bindings/usb/maxim,max3420-udc.yaml       | 28 ++++++-------

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>

