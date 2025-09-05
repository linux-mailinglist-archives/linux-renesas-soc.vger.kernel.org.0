Return-Path: <linux-renesas-soc+bounces-21439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFEEB45022
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 09:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8946B1740C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 07:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667B526E16A;
	Fri,  5 Sep 2025 07:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LKtWmL/9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F31DF71
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Sep 2025 07:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058210; cv=none; b=F7fjS5GI7wHTwk1H5l4ejrSK4XXDfzo2fIdSTdA/8AtvCW6tNedNkQRJcn78tlzn5T8+HX2j9q08yl8ff8uyeko1QpiVzVqxAVdqAx9sSagBLs4kRM7cXMhrtcITYWVL1EEYoOFRdISRrTMOOPTyrGmlfgzgYD/2Jnp8bNmeORs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058210; c=relaxed/simple;
	bh=bsdXiRg5jpsxkzgX7jVctkBK26SfSXlpC0q/1gug0lU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RgbgeHZqzzaMjbm5jlXE08k+IJxsSzCdP5mKuZj+AOnHVZv/+d95wt9KXIJiEjk8Ox5jucNXbmS7xxphbNnxD71IQT+dry+p+OdNJaVkEayz9SD1xisQHn0L41HqZa3bpFHTE3u/Mj9A59nCOU+j3cCHQ6cRLzxBKimEPvYBgGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LKtWmL/9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b8b8d45b3so17382595e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Sep 2025 00:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1757058206; x=1757663006; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcFCT9zW4aA60fZ7BLnEw73ykCEqS3kxh9SMpfaPMuI=;
        b=LKtWmL/9mZjRiFHkXt/BZ5UmcXFskWcCR7l1+sdCxkNbNl272KwAOAmrQz0qqLGgEI
         bH1Lwp+/ikays8wJ27SYslmwB7owquYaVQrz45GLQhsTO+4tARW5CUbBfNr2fV/zPQ7i
         F07cL2yhHR/65RI2bQkvt1nujiufYigAUKG1QOo5K7wVJO8QX4Ut6OPR/XUYXFa+UONh
         0NOL87fJdbZk0mOu8VtdnBh09MQhyipIRK8tY6kdSPLWlTPGz7b/97ZB5EGAfDJrAPGp
         ePQH7HdmN+QQey6Iw9A0KA054dC/fIhvmpagN0En+x8XL033nY2Zh1l+YNm82JXk3tYP
         LLjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058206; x=1757663006;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcFCT9zW4aA60fZ7BLnEw73ykCEqS3kxh9SMpfaPMuI=;
        b=mcOwna57spz/IMtZrzOH7tjrft2JCPvxhmx/1i60bUO12lHkKyoHjFYhO3wHjyVQGm
         VNhvl7/iYiiniLJB7PKni5G9Fc2SdIt7UuXZVAxeDYcvVNqQkUZcW1oNlWM5CXJzraD1
         1KJi4yb8nk3coXplYA03vfXE3Tz3ndHGzTd64Tk43LoSvega3n+zXN1ayb2F9bR7WQr0
         kBy4VeUuyjdFXNEgbpHq5rlr1muqXjyqmGgTs7TtGmDjghXxAAuaD+3sszg8CPnGATuY
         E4OWN08WO+bghenHu6TQGnkEXxBFF+jVBXQ6F2E2McPJi9ajyH29Ey5xKpqUo3rimmDQ
         WoFw==
X-Forwarded-Encrypted: i=1; AJvYcCW5Oeo6FGITV1bvB9K8soUoQ4dyaE+dysXPPzmSh6C4pKzdRBfoXRCWw7nEiS5Yv3oxcATSIJddyENwu8r4hq7kUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrrifwH0uf5aun0sPfBHuRbMkzI2iu5FPD9y7S+siduaglnRqm
	MmzkCZW2uP9PkPmWX2ieUEZHPd7EqW9DTZ0a5mUXKuu61RTnaKdq1kT+MXji1AgWYUc=
X-Gm-Gg: ASbGnctOmg/JlhuHdbp6b20ks7GwC5ITo8ep+8977tNSRJh7WvT9UeoEJKHbQG1LCQZ
	QzS9cB1mvro5gIbwulAiP9vA4aPTEjtW/DzfuWUg4XH+hMW3v+KibVdQP+F0Edwx5siz9DyykiV
	KZ0JOA2klY+p5slvLKzaKo5yvh9cChu2j8Lz5Z7QzqsAOP8vRTF0yjCAm4cG4qQU5uh5wE6GT6o
	nslZHxH4bAle6mjaSAn/xH5O0f+d4uDxPS+/8umhLcQ/scK6luBWBLehkUNonYn1D4mCwV0jsFJ
	ylirsIJEfDoaKN8XQQ4CLdeR/b9nNxwMeLbsohGHQrJIYvjzjKW9kFM1GGis/bq72iSLprJyCdC
	nQ+HbKt0bFuhAl58xoo7pAAWIPFFS6lLl
X-Google-Smtp-Source: AGHT+IElpZ/nNxUYJfXoPhKCLi6yxVHIT8+Ii77o8BHY6J90x7XkcR0yo3B1qo8+VJT1qApCcEJbSw==
X-Received: by 2002:a05:6000:2f81:b0:3e0:b982:ca3d with SMTP id ffacd0b85a97d-3e0b982cdd7mr4374615f8f.59.1757058205661;
        Fri, 05 Sep 2025 00:43:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:f203:7a74:e497:6da7])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e23d29bb9esm3900639f8f.4.2025.09.05.00.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 00:43:25 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Niklas Cassel <cassel@kernel.org>,  Damien Le Moal <dlemoal@kernel.org>,
  Marek Vasut <marek.vasut+renesas@mailbox.org>,
  linux-pci@vger.kernel.org,  Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,  Bjorn Helgaas <bhelgaas@google.com>,  Frank Li
 <Frank.Li@nxp.com>,  Kishon Vijay Abraham I <kishon@kernel.org>,
  Manivannan Sadhasivam <mani@kernel.org>,  Wang Jiang
 <jiangwang@kylinos.cn>,  linux-kernel@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: endpoint: pci-epf-test: Limit PCIe BAR size for
 fixed BARs
In-Reply-To: <62584e30-72ab-49df-bfaa-9730679b2dbe@mailbox.org> (Marek Vasut's
	message of "Thu, 4 Sep 2025 23:29:15 +0200")
References: <20250904023753.494147-1-marek.vasut+renesas@mailbox.org>
	<b3d5773d-c573-4491-b799-90405a8af6a9@kernel.org>
	<aLmGBYOVevP5hH0X@ryzen>
	<62584e30-72ab-49df-bfaa-9730679b2dbe@mailbox.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 05 Sep 2025 09:43:24 +0200
Message-ID: <1jjz2d4a5f.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 04 Sep 2025 at 23:29, Marek Vasut <marek.vasut@mailbox.org> wrote:

> On 9/4/25 2:28 PM, Niklas Cassel wrote:
>
> Hello Niklas,
>
> [...]
>
>> pci_epf_alloc_space() works like this:
>> If the user requests a BAR size that is smaller than the fixed-size BAR,
>> it will allocate space matching the fixed-size.
>> As in most cases, having a BAR larger than needed by an EPF driver is
>> still acceptable.
>> However, if the user requests a size larger than the fixed-size BAR,
>> as in your case, we will return an error, as we cannot fulfill the
>> user's request.
>> I don't see any alternative other than your/Damien's proposal above.
>> Unfortunately, all EPF drivers would probably need this same change.
>
> It seems that pci-epf-ntb and pci-epf-vntb only use BAR0 (BAR_CONFIG) and
> BAR0+BAR1 (BAR_CONFIG and BAR_DB) , so those should be OK on this
> controller. NVMe EPF also seems to use only BAR0 and it specifically
> handles fixed size BAR. It seems everything that is in the tree so far
> managed to sidestep hitting fixed-size BAR4 problems on this hardware,
> except for the test driver.

As it stands, a vNTB device needs 3 BARs minimum (CFG, DB and MW). The
NTB one may get away with with 2 BARs, with DB and MW sharing one.

If you referring to Renesas about that BAR4, I did use it for vNTB.
It is indeed not upstream ... yet [1]

I think it is possible to have vNTB on 2 BARs with some tweaks, putting
CFG and DB on the same one.

[1]: https://lore.kernel.org/r/20250702-ntb-rcar-support-v3-2-4268d9c85eb7@baylibre.com

-- 
Jerome

