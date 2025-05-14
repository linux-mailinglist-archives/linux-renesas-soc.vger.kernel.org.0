Return-Path: <linux-renesas-soc+bounces-17102-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1DFAB6C92
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 15:26:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4858A8C72EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD5D278163;
	Wed, 14 May 2025 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q13wIhH1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0E01C8614
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747229159; cv=none; b=rFsHIg8WC15sVZ3RjTYLmofQhdx8iw7U+CCnonbn5BpiParaUO1Hm0DN4yfqulxbczX4cJnMRZgKYa3ho3FUsFxscQe/Voerf/vDjKwZZNeHp03TO8/YO/gGnmsd+OOhb7QExoYHFv+ZUECV7ZJASdEsaFBbgdYsu5MdxgVonao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747229159; c=relaxed/simple;
	bh=tr9E9784jwlXVIOi8Tb2FBN5PrzKrA+2gad6rjWiPhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nm3zoqoM8wD0LLsnuoUHqenB0a+baSG+duZ/9ssRvx5MkhgeHk7OwuI8dfppZML2NLfJqw2nybqAZWTCTjmaSbZf7gpnh5iS49biMkBxmrMj6ctGOfta0WKWVwCR+telAHFUaHQ6e6kfVNMwJErviHXMdzf4hwE+CRE/JodBaSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q13wIhH1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf257158fso47742475e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 06:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747229156; x=1747833956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aakUawqIUHWGlW/tgWhb5T3+gxdqWvRqHtfYG+cbNxk=;
        b=q13wIhH1l4gkmvhI8ySwYJXgnl8fM6KJAOM54awKnP6P+XLryqZoGbR7RriQtlQS3k
         Rbppq/sWlUWAt2TI2QxEgShyITXVcCZGxqQjJts1fZGdutL3qZvEYiu1haG5wMtqiiU5
         mQRWAerULFRSYfa9jmw5tK9f3clk9JZsqv7qa4zN+Vzy0FUx/nAsgSMtwatfqm0Vy7G8
         XqDx8l6+B3QvWa2TV8kAX/gjCPNUjeKHRc9oEUNgi0CvVQvfdRPj8UXdaGc0a9iWXTTa
         A97RHATghSljYitriUG2MW/hd5kJpZWtDYCAexRbP+AXDkKyP5ygE8A+9H8X19qN7Fpn
         NnrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747229156; x=1747833956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aakUawqIUHWGlW/tgWhb5T3+gxdqWvRqHtfYG+cbNxk=;
        b=n3FHopfrAkxcSJsrJ/xsnn1kYhiIAcqL6f/aNZVjGm55g8uVnRn96UY3mzTNgA7lYw
         W8W3T3VWWmhC/y3RaNhW1ezfuvM5wKRwA2pbzO8f38J+XzOIWcUvVpa7SyT/47oo+okn
         EwOoaiVA2JmLouZ2ZrcrsDu/KjMUCuARLHGWB/t91QtG3IrnY+5M/R2Pi5v6Mkma5NvE
         ticn6IfJ9A7y6jDJwj2zwQp1R63mrNc1eEHsnETpDfU6bkveW0wY5IUg54jCU3x+Mef1
         Aj1ps7DFXlFgNiVuciERj/L23BVRqg0+Z+Z5O30zpKInPElbGSVRqR8rR5vJpgjBGVVY
         tXTA==
X-Forwarded-Encrypted: i=1; AJvYcCUT8OE5yZtd3ErmcB93nFdL768LwsVLt2Ez4gNxfHXvZhyX6nNcIwmW0sd6KtLZOOG5hud0Rn51ii15XLsHI1t0ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHFh/TDUeWujzLGYCfuTfkyL5BVjcHVXFa9OUHFQGZBkJCYzk
	RvoSOOHy8dq9ulICRkaeTTg9IQCNHdvSQQuG5iGxZFfITlnzzTJpGKjXdvzdOQ==
X-Gm-Gg: ASbGncvv3xZcCIofAYIvP25Ngc8U84FDRJ9RGR67n85hzCK8prDWBYk/W5MKp/z7mXA
	DEQ+wjXzjsXrnhOXNAlUDldQ4eQN+7YIwoBgwOPgNJszan//2H2jPW4gjZvr+0njJXc12zbP92u
	RtLoUp7SAjrOxY/NJIIMBdm+yZi95yUGX90lhJmnQ2DVQPZMQgWnyEbKzndNIz5VtKjI/yYOtmR
	GyLcNo+MgYUPCVOIEVBEb/R00n5xYsgnT0Zu8UgUkAUHBdoXXmXDA2cJUcYxLtofelGmR9kug88
	WaM9XfrZ1EFVO+TZJOYYUmFPaq+WNrq/EKOV74paTIGy+x7woxhQtOwC93hs9X2/KKAgKW3zN75
	smzUMHEffcYGRSLpQUjo9xa6yXYlm1RbWeyt+06kpK704
X-Google-Smtp-Source: AGHT+IF69aVHh6QQL7Y9zF5wlxFHQroYuTRB4UFZmRCFpZtw3Ef3bncMvZbprgUs4BgS/0hcTEg57g==
X-Received: by 2002:a05:600c:c059:20b0:441:b3eb:570a with SMTP id 5b1f17b1804b1-442f285d105mr16754775e9.2.1747229155857;
        Wed, 14 May 2025 06:25:55 -0700 (PDT)
Received: from thinkpad.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef8c7sm29528365e9.38.2025.05.14.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:25:55 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Alan Douglas <adouglas@cadence.com>,
	Niklas Cassel <cassel@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/6] PCI: endpoint: IRQ callback fixes and cleanups
Date: Wed, 14 May 2025 14:25:51 +0100
Message-ID: <174722913586.17855.970020852326837636.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514074313.283156-8-cassel@kernel.org>
References: <20250514074313.283156-8-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 14 May 2025 09:43:13 +0200, Niklas Cassel wrote:
> The first two patches in this series are IRQ callback fixes that should
> get backported.
> 
> The reason why the bugs existed in the first place is because the APIs
> are very confusing. The rest of the patches are cleanups of the APIs.
> These cleanups should not get backported.
> 
> [...]

Applied, thanks!

[1/6] PCI: dwc: ep: Fix broken set_msix() callback
      commit: ef2a2813f4c738a5c8f71d47537a8e79b1058319
[2/6] PCI: cadence-ep: Fix broken set_msix() callback
      commit: 24e50b43ebb98f147984054730cf30aebae23c51
[3/6] PCI: endpoint: Cleanup get_msi() callback
      commit: 6f91c4cae6a3d895265e533630c00e1c4a0b8dee
[4/6] PCI: endpoint: Cleanup get_msix() callback
      commit: 262df0e1a10fa8470103d343fe85afbba4b25698
[5/6] PCI: endpoint: Cleanup set_msi() callback
      commit: 2b9391dcb26739d0b43927b329d2b670418c69a3
[6/6] PCI: endpoint: Cleanup set_msix() callback
      commit: 210de38727c862164e933d978ba39b66569ab552

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

