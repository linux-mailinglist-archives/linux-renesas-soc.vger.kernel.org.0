Return-Path: <linux-renesas-soc+bounces-24574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB7C58788
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 16:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 15FE335C9AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Nov 2025 15:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6CA2FC88A;
	Thu, 13 Nov 2025 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GpdDsCqr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFBC2FBE1B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 15:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763047488; cv=none; b=lfGqqY56sijfAhmHb2CMYKl4ZYkifOGrOibAN5coiCN2/GCXNQDkNfpzNuP18FlSh5/riGXfXr15eElz2X0gsFObg+Lj/NlzDeqLjrPv1XtqxrfQaNblwUlQ4yM6O2nXmuVu/h+fDfMo1IyD/rEmg5VG74m9QoIO9oFqxhQbiiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763047488; c=relaxed/simple;
	bh=a8Oh4ByEmIDtGdZ8h4OuLqjW5FkDttrFXTOx2NT4iss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vCJWb7le6393YYjYrONT9ZgiG2jzxnOGC19v3UzdP6eBZih60HhS9iA/rG/Y7h9P6DXqrFAuJaea4NROVLIsf6fXEwJHGdZ+v8v6hF9Qkg9NQGsIhkR1X6Rm8wmU4wmOY6d9V1xgRoyABZG3tJxuIbY1JDalFptuFJS+23CrYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GpdDsCqr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4775ae77516so10861105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Nov 2025 07:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763047484; x=1763652284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB+JT+rAjTzk5qbj4tgjSnTjnda4G40CL0DtaEMW97s=;
        b=GpdDsCqrLIix28BI6t007HUPegFO3MBRZgB+SsxTYwALow5rm66zBh7t9qjBFivPWE
         9aejZSa4HfhABOr6MBT/H42UMdfZ+lXTQnVFGpLhbdaJ5Uu0o87PxRV6xE4HHyJdDRyr
         hZMlg2jqpoPlhE4vKjAeIumZrnEF+uShmuoRgQitPSYH3UfskwS8yLLUqn1WBrHwV6hp
         Jg52+FUe8trj5HkWCpWirpK17M1P2A/T0h5OtgIZaOdGx1WSuCevnkJu0vZMSgBnjU0Q
         w1sU4r2Hwzyk91khCOMvNt/KezqretHovC9HFa4DHXOffv3WQB2j5AcbCfbLxmloQy1n
         ENyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763047484; x=1763652284;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB+JT+rAjTzk5qbj4tgjSnTjnda4G40CL0DtaEMW97s=;
        b=ZMB3KCepCoqn1WsiHml/NBgJTH319+b+C5+TUvpXBJySNhCqeA6qniB9AB/ECVRgyS
         l8Zm5RPLi5lGcKqVXFrd57HfEwH/Wn9uLZ/4q8igQGE30UjzI7DNjPYykG0LRtTuIru4
         gbQImP63ygAvA6iwSZ2M1s8jRQEe/Gf0oS0Zi3cAlBHKwK5+98XBNe1YlfqtPD+q9ytt
         i3y5Ul1rkexJu2YrBnynBmHPvhyHHE+Whh9LlhuswLidNx9ZpGJXp/Z7igpuWhHuJcoE
         QHLxH9LIemHEOaNIK8FM3iWcnNpEF2rKK0cycNDIMJ41PcYL92Ny7fu7KBXjJTO1nAL4
         bDiA==
X-Forwarded-Encrypted: i=1; AJvYcCUlwLtMxpKWlAK0AVlb7saJLGzhSzHwiJtIkMdp8RMdLVIrN5rRKHk04zzCtkSEd21cHvDXwivoOsx95j2o3d4KEw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+2rxbFNoJkE1U6Krz4M4bdiYZDyPNK6r4y06gLUKFSqf6bfuc
	2a1Dhy2U4MMkIFBTzvBqkRPYYSof0r5uKFLV//1wMPuiUW/lDvEakCvDXGy4WVOYBys=
X-Gm-Gg: ASbGncsLkT0qSfE4SjmYUlPyuDAIGWbyUqXnrDw45qLJc4hEBaJhTQydBRlm5FoU/Ih
	B7uy64XlWqI0SsfRyQVSEtuPh+cDlhJ4ii9y4ydoVpIeqO3k2J+MeBymdRH/Ag4GYbkldF89el6
	nwtxeMsoA9eig7SO8qib8qhDh9vAzV7EHzFsw0JoNbr7nJMYBsBSGFL2m/B7sV8x8J1qfyA9V7X
	9JwipJ4YYigyC3uTf+48mp4Vo/qW7xM9e+kXgHM9JmxrPeo9I3f6naTqQV9ZuEkctPktiZPSmzD
	RWVjzZsFVf3yHwE0oM3CnLcmffmUI8Y9yOc4O/jgNW5nYD7FiC9+epf0MbY81e42OoJPZYE33kH
	wM+zBRVmmjCEzVb5XNxQLSIrBU6BBbv9CDWxdfLpwrvrhH7HjWf6OKN0lmsqxU82iiiy7qkWOuC
	oMGk+H4d5n
X-Google-Smtp-Source: AGHT+IE4kSPN0NcyZr5YwaFByd3zY3e87tD0XqKRmf32VutndhscEu4TOszysUiok7ZPHwh1vTJRjw==
X-Received: by 2002:a05:600c:3546:b0:475:dae5:d972 with SMTP id 5b1f17b1804b1-47787095cc8mr69292105e9.23.1763047483038;
        Thu, 13 Nov 2025 07:24:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm4923542f8f.20.2025.11.13.07.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 07:24:42 -0800 (PST)
Message-ID: <c8f7f55e-4229-49b6-8627-2a177ca85d5f@tuxon.dev>
Date: Thu, 13 Nov 2025 17:24:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host
 driver
To: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20251029133653.2437024-1-claudiu.beznea.uj@bp.renesas.com>
 <20251029133653.2437024-3-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251029133653.2437024-3-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/29/25 15:36, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> only as a root complex, with a single-lane (x1) configuration. The
> controller includes Type 1 configuration registers, as well as IP
> specific registers (called AXI registers) required for various adjustments.
> 
> Hardware manual can be downloaded from the address in the "Link" section.
> The following steps should be followed to access the manual:
> 1/ Click the "User Manual" button
> 2/ Click "Confirm"; this will start downloading an archive
> 3/ Open the downloaded archive
> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> 
> Link: https://www.renesas.com/en/products/rz-g3s?
> queryID=695cc067c2d89e3f271d43656ede4d12
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v6:
> - split the help message from Kconfig to 80 chars
> - dropped unused defines
> - dropped dot at the end of short comments
> - re-arranged the members of rzg3s_pcie_child_prepare_bus(),
>   rzg3s_pcie_child_read_conf(), rzg3s_pcie_child_write_conf(),
>   rzg3s_pcie_root_map_bus() to save few lines
> - in rzg3s_pcie_irq_compose_msi_msg() drop drop_mask and use
>   RZG3S_PCI_MSIRCVWADRL_MASK
> - merge INTx and MSI configuration in rzg3s_pcie_init_irqdomain(); with it,
>   rzg3s_pcie_host_setup() takes now only 2 function pointer for IRQ domain
>   config and teardown; also, updated the names of other functions to match
>   the most used pattern accross other drivers:
> -- rzg3s_pcie_msi_enable() -> rzg3s_pcie_init_msi()
> -- rzg3s_pcie_host_parse_root_port() -> rzg3s_pcie_host_parse_port()
> -- rzg3s_pcie_host_init_root_port() -> rzg3s_pcie_host_init_port() 
> - used dev_fwnode() instead of of_fwnode_handle()
> - used fsleep() instead of usleep_range()
> - pass "size - 1" to rzg3s_pcie_set_inbound_window() only and keep the
>   undecremented value in the calling function
> - added a comment on top of request_irq() to explain why devm_ variant
>   was not used

Could you please let me know if there's anything I should be doing for this
version?

Thank you,
Claudiu

