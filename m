Return-Path: <linux-renesas-soc+bounces-17131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70123AB8791
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 15:13:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 177601893B21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 13:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DF52980B2;
	Thu, 15 May 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wL7yyb+v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAB029A9DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 May 2025 13:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747314735; cv=none; b=OsirHCY+wMN88cskfGDF4BUDqW+MPZjhKxNGM4j7i28P/gPdv4srIOkyAlyPg5MpAGyoZ3SHmectp26m1FyWSw1Su6DDwV02UlZrQitAX1b27J6NtHLBQJvA1Dvufo9a7odYDHH/h1JwSYR5qsVJHGE/DlxIb3A1YIWmmmc5Xyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747314735; c=relaxed/simple;
	bh=aaXgNL1VT+/xjMdQkulVFWEp4own6/PEE/2QTeFej9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPx3paWJA9rfJbrWgfMwSXuq4Hk8a697I3FSfM6RPPLJjVaoiHPdVEgMrSN9aTkfCBWiszaTtKxBFLU+L6hfSP7AGgceLYE5rF11/FIocpDLI7gdyUBRP/QbFeEiGJUAsoTLcshCxN46AAkQY4VdhFtpdzEclsmVChCgUtgwF2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wL7yyb+v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so11149305e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 May 2025 06:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747314731; x=1747919531; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c3MKAYkLPhubyXeqbsbbCcT1xzf3OGrKxlCFqhiA9Kk=;
        b=wL7yyb+vOdzehR2e45DYkhLUmE3W5YDwaBXhcyEA6Ler9n9ATCM8gJncoXFSbrU/n2
         N2BM/Y4+Uf50WAhm5SGpNK7DNN2LaUUvcKxo/ww3KgmXn17amXuWiMuc3B+BCtevUsu4
         WB8mAHT9ZTxRtk5TtCSTsb7KJnopoGIN4ZneQkTLOdj1N5WI+TVlRYT8cljpBeHkr7tw
         RQ3C77kVjdTCBxcueZNx/zrdiE+jSvNSAMZigL0OHzUiVydaGhAsrMrjzkd5ViJHOxP8
         6qmL2zj594Tr8AuKzZBe13X+DVl83fHy+YsiPEXjF9TczuiS/rtS47Cr91uY6nsgrQfH
         TAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314731; x=1747919531;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3MKAYkLPhubyXeqbsbbCcT1xzf3OGrKxlCFqhiA9Kk=;
        b=c9Z1yNgpD1hRkOjmpeOF6rtXMbEqNPXGGVSFIAodiTYddSptc3DSD14eaIjAQPw6b7
         43dUDW2p5LEpkGg9TRuvpDolht9jnsVqwIDOFW6Ay+Rwgwc8S1cUQriTg83U8/58PJJ6
         oU0VcTLvlniIO29/5QGhrYf8A2AptlrVv+VpW+jRMkTULB09Qnk9eN4fceAdcZTlXHam
         e8z4iqmcc7rojRfzueMAdOd+qWwZnetoeLanX5c29pT4WoGyweEWakfCLbY2mV+vcCfD
         jc71PgJ9tMKhlYWEMhWGkTUGbPDHMKvAvystwp8ZnlnEqWPY1yl2Xvdh+65OpEiA+1pV
         INLA==
X-Forwarded-Encrypted: i=1; AJvYcCV7UTTPbiaEg5g01XDT2T/8/k7v3eDQ7zlU30QAdALAN7SBXafOWHUrFjVHnGKnaLH9j+11ANXnVKRdNTs/LnvBUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw35/t1LBxFgM8DrZh24Egbpyv5mdpGuVzpEKjbDyqfkA9lWdQA
	/GOS5Cpj9ej0DVNNkpB2iVWGEgaEWjINsYo9qvbIrb+xLAJmlO7INiVkU1r8MA==
X-Gm-Gg: ASbGncsbVWA4joE+9A3BCCBTpl7NJL6EtuuI3szvwP/sKbgKxcAeRg+V+P2eOWhw4AL
	DKHQNuEmxiF7GbJw7l69aeQVR6swO2q4ar5JHrdzk/c+/t7DzelraFmdohuXKA4YSwZxnEg2QfI
	a7Qs4gQUQGMrlUcaTkq8H5mzIk0x7iy0/1Vya81x26RQg2r7wtorZmV2SBN8ianxofQGDJw6ivY
	ktur48zvBxP+4Gn0I6uZxOVGLs6ZJe9SP8h59ofx1vuFlbRrSxU44a07A5zK/ef7iVCk2QQIhGp
	UAhCIZbNbfJTVBItve7kdeTbe/75PGNfVhpFhRXKDQPsFGrASFv+6U/Glh17lt0GJmThuRNkupS
	R2xHIb3gklc2RaQ==
X-Google-Smtp-Source: AGHT+IGKu1Mwu1s2x6/w2xAPOyXhBfvmQmeWUcOFV5VesSsNvTc5Oo3A3N42qaHch1nRV37wsCynTw==
X-Received: by 2002:a5d:5f8e:0:b0:3a3:5bf8:36f6 with SMTP id ffacd0b85a97d-3a35bf838cemr980643f8f.55.1747314731020;
        Thu, 15 May 2025 06:12:11 -0700 (PDT)
Received: from thinkpad (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3369sm22999193f8f.57.2025.05.15.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 06:12:10 -0700 (PDT)
Date: Thu, 15 May 2025 14:12:09 +0100
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: bhelgaas@google.com, corbet@lwn.net, marek.vasut+renesas@gmail.com, 
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] PCI: rcar-gen4: Add a document about the firmware
Message-ID: <bo2hxi32znmikg3z6j3rreqqksoijfn3ugb5ahyn4qirixc2b6@k7bs2lvipfz2>
References: <20250507100947.608875-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507100947.608875-1-yoshihiro.shimoda.uh@renesas.com>

On Wed, May 07, 2025 at 07:09:47PM +0900, Yoshihiro Shimoda wrote:
> Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires
> specific firmware downloading. So, add a document about the firmware
> how to get.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Looks good to me. But there is a small nit below.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> Changes from v3:
> https://lore.kernel.org/linux-pci/20241024120525.291885-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase on v6.15-rc1.
>  - Revise some descriptions (reviewed from Manivannan Sadhasivam).
>  - Add the doc file entry into the MAINTAINER.
> 
> Changes from v2:
> https://lore.kernel.org/linux-pci/20240703102937.1403905-1-yoshihiro.shimoda.uh@renesas.com/
>  - Rebase on v6.12-rc1.
>  - Move the document file on Documentation/PCI/.
>  - Add SPDX-License-Identifier.
> 
>  Documentation/PCI/rcar-pcie-firmware.rst | 24 ++++++++++++++++++++++++
>  MAINTAINERS                              |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 Documentation/PCI/rcar-pcie-firmware.rst
> 
> diff --git a/Documentation/PCI/rcar-pcie-firmware.rst b/Documentation/PCI/rcar-pcie-firmware.rst
> new file mode 100644
> index 0000000000000..0e285c4a7cd72
> --- /dev/null
> +++ b/Documentation/PCI/rcar-pcie-firmware.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=================================================
> +Firmware of PCIe controller for Renesas R-Car V4H
> +=================================================
> +
> +Renesas R-Car V4H (r8a779g0) has PCIe controller, and it requires specific
> +firmware downloading. The firmware file "104_PCIe_fw_addr_data_ver1.05.txt"
> +is available in the datasheet as a text file. But, Renesas is not able to
> +distribute the firmware freely. So, it is required to convert the text file
> +to a binary, and the binary should be placed in /lib/firmware before
> +the driver runs by using the following script:

nit: the above wording sounds like the script places the firmware under
/lib/firmware, but it is not.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

