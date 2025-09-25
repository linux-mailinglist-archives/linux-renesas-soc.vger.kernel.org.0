Return-Path: <linux-renesas-soc+bounces-22374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC11B9F9F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 15:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CA71561B87
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 13:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1974326C3AC;
	Thu, 25 Sep 2025 13:41:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6FC26CE0F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807690; cv=none; b=AZnIPZW/sqvLHGT1yPgn+gVC+vrsJPUJ36iPFx9bMd/8mRmZ5bDL6Fg+DFnTXMpiWrhhxl8VcMLray19OQizqfImLIRjNWvIP/h62NiewjCQo/Y6Gy8Phx41ZMPV30OsfFEKUUKuVE20NA/OoxrwStFOUJb+FW64JNW9H9mIwTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807690; c=relaxed/simple;
	bh=yWrAvDUxWQXIzW56d3MPuuqkacdrARQS1P4pA07i/9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIM9hBxWt23Ix0M0LuOSCGzmMB7tSdegCnJa9PEepc/81OCPJG5axqtVSsPcDD6fMf23SNR3OriyR2d6Pc57r4p71ZDxXyNaoI7Cu5KVLzT8Kr7nNHK325xVrr1wbG5trA+ZM/MCknajwFHK6eUSlVD9d2tAuI42uXUGJA1QyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-55ae619545fso1008230137.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807687; x=1759412487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKlrAAnA60Lnd9KAaHPo/7FLM3eM2qdMm6o85zpT6R4=;
        b=inrFWR3wsaxMgzCDe9xxIcHN1M6yAthmQN0Jtu1U/mgCiZtJWhsmv1j2xiJMgYdbs1
         jzx5PEiHTZzsvWM9OjWOmMmNPlnXUZl+zPo+m9AFdzjrIARN+EDf4dlXp8UfR7Nxh4Wl
         jfdb9kG9kOXB+8GcvLQnBXDpwvDvkOJ+BzcfUM5yhp2WJJuA1FAGnQOCuwwtI7Q+P2Do
         wOKIC03Dp8+TOqCkzobv9LnqYpEU4ZkHqxtKS0HowRDgcLdN1YpJKnlXCcXaruL68At9
         VxK5A2bPDyvsU1VrknK7gAtqVkBSKqwmLFfiYpTH8/NRY8veEyQogLoXymuAAA9rttK2
         4uEg==
X-Forwarded-Encrypted: i=1; AJvYcCXuYkqA/yBMW5OqpEhH/2sa2bKC6xGa3s7WSmeY3mDlPcgvmDBOPOx7HaM8z01QwQnW9aHHdYo7hdhEs7VqA38TWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa8tWwgluRXGzM5QCzcPqpI7FUPS3G6+ZrFF876rYANtRbKnOW
	KHAURQ3A5ZhD1C0ZnbPD38yrY1QGIbEkJ6z/CoPxamxAbUZjqy5fZT1OBaOaf8Ot
X-Gm-Gg: ASbGncui5N4jNbUhpByzA01FYTap1pPgMFTwhwnJrWB9tBHITm26jr0FJDLAECzuD9x
	ARwH1KWZd+oNo14dZBMcZta0uTbW2Py2QDJYmhjZTKTUW2UdF/BbLHn5uuxLVPCZd32F9YXut9E
	AKzOgECgxMoWWBC3Mdz9tYJpv2eh/kkVlgNi1M7GvDPEXLaWksM9OYzS6WnSM9RTbvzOuMm7BdG
	2yzsqK2xY66c7gIlz3g8VqlCyf+p0G3Yl5ea7YNPcxABu6fRd1oSIKKNS2s7OHnZtp6kEBGckdb
	urJx8wZdTipfBe0BYlSE7UwcrZqIJnFwW8T6D5apSLQt69qAMILBJCLcVvr7P+2wiZkzVospI7k
	xt707v97bO3ZaF5EMOReqdbruWKqmnpZngzQH24Qw8frCrXMyqIGwC/CEnUsc6/6fAzoWs/4=
X-Google-Smtp-Source: AGHT+IFqw4onBNy+dlR9CwfWnpVIbQ01XgiASMF3GQWIGO0yKzXPzLoLw4dNbvNSLi0yhdzzkTNdlw==
X-Received: by 2002:a05:6102:cce:b0:522:a762:8e5d with SMTP id ada2fe7eead31-5acc8e91381mr1616245137.13.1758807686623;
        Thu, 25 Sep 2025 06:41:26 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae3182b293sm576401137.6.2025.09.25.06.41.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 06:41:26 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5aa6b7c085aso1135675137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 06:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWWZkfW50VKPeJYAjlO9rUfKjRNnQc+9jthXtDSz1XEyRk83vqRp0PQ89oFef0Z/qkv2icw4e+IabMyqy17FFYSVQ==@vger.kernel.org
X-Received: by 2002:a05:6102:442c:b0:5a3:eb34:6105 with SMTP id
 ada2fe7eead31-5acd1c8364bmr1477467137.26.1758807685387; Thu, 25 Sep 2025
 06:41:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924005610.96484-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250924005610.96484-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 25 Sep 2025 15:41:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1efNhhW1ROSULP2WGBKiUDiCDHd5KHPa8RS-5tUqZww@mail.gmail.com>
X-Gm-Features: AS18NWDJuUpAWpHtyOB9jrnXGaOx0X3jXoCYo7hnHhvcwX_HD2k5hjD-20MZx-4
Message-ID: <CAMuHMdW1efNhhW1ROSULP2WGBKiUDiCDHd5KHPa8RS-5tUqZww@mail.gmail.com>
Subject: Re: [PATCH] PCI: rcar-gen4: Assure reset occurs before DBI access
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 24 Sept 2025 at 02:56, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Assure the reset is latched and the core is ready for DBI access.
> On R-Car V4H, the PCIe reset is asynchronized and does not take
> effect immediately, but needs a short time to complete. In case
> DBI access happens in that short time, that access generates an
> SError. Make sure that condition can never happen, read back the
> state of the reset which should turn the asynchronized reset into
> synchronized one, and wait a little over 1ms to add additional
> safety margin.
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

I have tested this on White Hawk, with (in any order) and without[1],
with and without CONFIG_DEBUG_LOCK_ALLOC.

> NOTE: This fix could be removed once the matching fix lands in linux-clk
>       https://patchwork.kernel.org/project/linux-clk/patch/20250922162113.113223-1-marek.vasut+renesas@mailbox.org/
>       This fix is implemented to assure PCIe is not broken in case the
>       fix sent to linux-clk is applied asynchronized.

Indeed.

Note that to avoid regressions, this patch ("[PATCH] PCI: rcar-gen4:
Assure reset occurs before DBI access ") must be applied _before_ [1].

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

[1] "[PATCH] PCI: rcar-gen4: Fix inverted break condition in PHY initialization"
    (https://lore.kernel.org/all/CAMuHMdXAK6EhxPoNoqwqWSjGtwM24gL4qjSf6_n+NMCcpDf1HA@mail.gmail.com/)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

