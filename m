Return-Path: <linux-renesas-soc+bounces-20177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607FB1F4FF
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 16:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23EC76271D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Aug 2025 14:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7A02BD5AB;
	Sat,  9 Aug 2025 14:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GVsHEoD0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FC32BE05B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Aug 2025 14:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754750694; cv=none; b=vFU7g816NXE+qnUfSC6C1g3nx6ZVzypb0XwPA9L9W+DRw3lMYgdeIpsP6pIijytX4Xd1LXRD0WA9qvZGAVbv1P+lZIj0+5u6WnECDkzCm5sKgxhSippBafgehMn15/gti18exJuiEX6Xe5LBqXjyPxpe7tk1bb6m0PisgTtYNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754750694; c=relaxed/simple;
	bh=//K7yi03aIfeehIyo3o5++11x5/89R6GKKbqCb302vE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eajjkVwMf4fwXw8i4PCiYShYhbluHtdIPKjTb2XaRlI2lVrCxoGBYgkUyxjvuFZI7T9ZYQ0Ht6536w3x4PglkqFnJOw/fF3hatN3jG4toglCKxQQHrJTvD2KBt56wLJr+nikIgvOgsRlpDQdXJ0YXRV2+Nul8yJir+B7ZFNeomI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GVsHEoD0; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b783d851e6so2669481f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Aug 2025 07:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754750691; x=1755355491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=62tWEcOig/dfSmII8+B6nS0fppI/7HUrUbyrKzGRZQQ=;
        b=GVsHEoD0eJ7Av15RYbiCF/4IaKH8vxee1OPlxxBLx4aMpfPi6673S928/Yb4MQJaev
         a/0xiqrJCqlXcJASYbVic8u2bvLJk7Hv7abJ/txFfK19I6Yre/KIZbIRd2vzRxZY6UsU
         l9cArTYjlq4Rz4FqM1T//27ThUf/hTVZA+1l+GbMOFyhVMiQ4FQYDZt4KVPgMaUX626H
         j5rRYFVh0BmEulqw07qpugzDeSVh2mhwoIZt7CSTwEb6hFEiH7jlNc6kVXSzqzq31tei
         8uT8WsNPKyPBiFNe1B1LAaLQQRXab67tHORPiczCqV2rXlp4VERj2YIADHq4pgDNWepd
         SFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754750691; x=1755355491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62tWEcOig/dfSmII8+B6nS0fppI/7HUrUbyrKzGRZQQ=;
        b=IV5Km3lDnlxy/ZBGsEUApBFJ/g713/gMwX1VvK7+VspzWhC+6/Vy5jzDe77cMrqC/q
         WAxLGvVPAE4lxWUnbtwQrjzrkcb1/tpxsFhDqRuuMzcpIYHbwr2Y+VojkSvaU394wq9b
         BR1ZDY0jl9I5Ei6o6dGPHK9BSXzBeTcS0VGnlGxHfwQYxwwqYPEfSs0fdWt9h/1S1hNU
         fncrrkAH8txNsjzYT98jztL0UbBJVomdBQ/ynCqVXPjBb+RiQsWuR2S83N/iKEU8LXDZ
         APdILQkJtK008qeZYqeA/zh5u3eJ48slJgJFuMRZnRb7Negr2gD8wapOtdmc2Lc092Tu
         kA6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGWPAqc8/PXaIAWietrxK7v1tAb50WJAXBCnyrTaLMPuD6KPHscyNAGEUpu/I/LHo8Kaloik6SPoZZiqzvaXvv3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe9XbHyyJzxC5+78GGPpXTbeZwHK+zLKSs4o22Lk51Vc5Rauy0
	zjmh6qm+ObU54GMYVv0vNCBIz8lLop9Hg5UyZ5Mir4/UMY2Uveqls4DrTPQi4UZDkeo=
X-Gm-Gg: ASbGncuuBLEATPZcNTFturvOxioMsNrGhEexmKKWMvGzubhJ0ggfi9o5KtJj9G01lRx
	ghjjOq4p3zh2Ji7EKp3xqFzc5bVJ2oSnGtgavl+/6CbHWKT779nSd6qOuZ9rLrwa0dBaF4qSf41
	x3FvpXdlkviAUQVhP8IEP57POKqEFaQ6gscEy1gUnGEZ2+CpHJxRXIChzvZnNEqF7fp8u6qI9lz
	qttN/jTsoNcD9cWmipuzrfEi8qHiufZwUt5ZBQMZAZZWwC/2GlHqWKy/1gFhz0lMVN4dX1ou5Uq
	Im6OliBz+F0feKKaxk24VYAx5TlRwYZmjhUV0HHujLp30aWfMOmydRRZOqp7V9ciHhx0O4pAZwn
	UFYOlgZraNVZwTwfFk9VNmsvqqJqjQgr3lGyffnY3VvrFYRbUBody
X-Google-Smtp-Source: AGHT+IF+KfnqXJwt6SMkli7edNPF5N9xOPj99QcqBfM5xO8yk0mX48AaSZy6q2XkBgGjZ3eq5eqZsQ==
X-Received: by 2002:a05:6000:2302:b0:3b7:9c35:bb7 with SMTP id ffacd0b85a97d-3b900b7bd51mr5308863f8f.46.1754750690938;
        Sat, 09 Aug 2025 07:44:50 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453333sm35314164f8f.45.2025.08.09.07.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 07:44:50 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: marek.vasut+renesas@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	bhelgaas@google.com,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	namcao@linutronix.de,
	tglx@linutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] PCI: rcar-host: Use proper IRQ domain
Date: Sat,  9 Aug 2025 17:44:47 +0300
Message-ID: <20250809144447.3939284-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Starting with commit dd26c1a23fd5 ("PCI: rcar-host: Switch to
msi_create_parent_irq_domain()"), the MSI parent IRQ domain is NULL because
the object of type struct irq_domain_info passed to:

msi_create_parent_irq_domain() ->
  irq_domain_instantiate()() ->
    __irq_domain_instantiate()

has no reference to the parent IRQ domain. Using msi->domain->parent as an
argument for generic_handle_domain_irq() leads to a "Unable to handle
kernel NULL pointer dereference at virtual address" error.

This error was identified while switching the upcoming RZ/G3S PCIe host
controller driver to msi_create_parent_irq_domain() (which was using a
similar pattern to handle MSIs (see link section)), but it was not tested
on hardware using the pcie-rcar-host controller driver due to lack of
hardware.

Link: https://lore.kernel.org/all/20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com/
Fixes: dd26c1a23fd5 ("PCI: rcar-host: Switch to msi_create_parent_irq_domain()")
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rcar-host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index fe288fd770c4..4780e0109e58 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -584,7 +584,7 @@ static irqreturn_t rcar_pcie_msi_irq(int irq, void *data)
 		unsigned int index = find_first_bit(&reg, 32);
 		int ret;
 
-		ret = generic_handle_domain_irq(msi->domain->parent, index);
+		ret = generic_handle_domain_irq(msi->domain, index);
 		if (ret) {
 			/* Unknown MSI, just clear it */
 			dev_dbg(dev, "unexpected MSI\n");
-- 
2.43.0


