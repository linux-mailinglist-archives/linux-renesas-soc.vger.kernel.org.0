Return-Path: <linux-renesas-soc+bounces-18369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE6ADB2AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 15:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF13C3A5EB1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F742DBF6E;
	Mon, 16 Jun 2025 13:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RtBmYFvs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368502877F5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082048; cv=none; b=R1XSscwmUF/d9ttcNasBR6kcn3rEvDrZkQsKpWI/3EPzRSDPsD+ii1YHLTEcGiEvO876VblVmFJr7y9zwn3mb7ZpH46k9N4olGopblNN/2g8ZI8zyUUUcVqURD9Ld3uA5NBJcySPfOCuIOytpsJJVSHqx5S2R9qm0/MgAgqczoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082048; c=relaxed/simple;
	bh=WdYsA4gcGJ4whUTHaU62r1/1/AwXMOqpKKD02j5KM2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGKIUbRrw/FvgSpf4Trgdm54qSSy5XabgNojlaerU4O2/KogV1k30HIXWXNTLMPQnyikreE6g9CGmH9suvBxResIUGApLNcXC7gY9ki27htrBKlEm+ZFrV+mn0M3HpbD51xXHUNynVUpOdSwEAhOYzZ1HMZd1CHobRVivXgyIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RtBmYFvs; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6869829a12.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Jun 2025 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750082044; x=1750686844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xJCI+6qwU3+gkjXsqHZde1TYEMyw88mnCNmjbKL5ih4=;
        b=RtBmYFvsW6Vw+ZL7FzFrE7wKDDtpCgAP3oBtY45llLJtfuIX5KB6kx+wl6KUVXW0wk
         AdjTflrSENkq8zVE1hn0C6SP7zMnPPh1FgAIiYI9Jranwe2S5LUJveuHvb2UrJYzH/eq
         ti2Lp0fuYXFr17hqjopDJRft1CSGHtXGdpyEIDoKKCYZP3FgOyha8/l3Z6oNimZ3doeP
         MBp12iEZovAIAA2B5T80taXplc7XWAnBMHZz8RWe49gY02aUOZBJ91mgYTftvKMFrQRu
         YvcI4G22TNevck4mSmfYTuwWsipLdgBLZBqy2PImcpD7i60AQA0wQ4lerrYyHpWIg39B
         Xa6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082044; x=1750686844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJCI+6qwU3+gkjXsqHZde1TYEMyw88mnCNmjbKL5ih4=;
        b=O/CjlX6RuC8CfgUhT5Q8uPRHaoHYWpmwG8JXNzoB8cT5TbTJRTVGVMJANDWvZ6j8+H
         AupoQV8TplqlF9sjfBsT+/qVfgF7B/iK6KitWqSIGjmd8vmk/WPo/WMx7CnLChp1o4jq
         UIZXrwh67vRatSgyqGEJgglW4TFsB7G41Bi7GSNjXaNxSnP6N3d0qxZS8gT+34SE9Hwa
         aB73WXwPtaSuP1rHCa3S0RpjxIW4riDbinsYE+AOgbuETlXCXrDAbofHx4O9F+ttutsn
         FhXW7TDW3jZwlCWy9Kd7OALVl/u7zd2geh6LYq9BRoyii8TZQMNis/Ar6yRMgfUkgJpC
         7+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ7b/AuiQOOzG4EEIbK/HuZQS7SGkpRXdJhsXBL2AkqaILRXa3Cv38jTC+IMj0KYTS1qpDMNZLNjvILTrPF7ju2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPfy1GsZ4O2ClPStItMCHzZnwCjeVwQRWsFq2AjLdVb596Y0je
	kjhsi/mcMNooodKL9W4vjmNRLWNh1c5BXW0EDK+wFrv/LXHTbm0hV8lbs9cUoiDrafM=
X-Gm-Gg: ASbGncujY7Zx5edIa8v4jOBwtYaGQb6iXo8S4dkrh3tfgHL9bNRQ1mqD4dAerOFmkBY
	Sz0DZsXV2r4r0hU0PYHGxSV1QWbyrraXKVLDROTpUPyhPH122LcnHAozgXLPZg0O8TNdaMJwQ/q
	S8NE20A8RF7tRjemuThk0QV5MAwBmUzgft/CXzkeY3kHXNX2X+ri+8dwQ9IGcggbrftckloF8q7
	ODNTj5hyPTQvOournkNiQo48IaUnlSR5w2BnotGA/9PI5V4iiSWc7uBY/ulmg8mmVXiZ8m5Fwvs
	trysRwQdaUagoJMYnSmOtgFygSQPHizApR8Wlwm6xeBhC8N9k+CcDMcd94MXn28ldjHsCeRJGSn
	1SJ5Hxb1OAuk51GTs
X-Google-Smtp-Source: AGHT+IFIEkskkJG9WLW+Hv9ZKWW2DbdD0zYs82b6WVAC9yGzm6OdzcpBZetxbCKgKVtLW2Au71dzLw==
X-Received: by 2002:a17:906:c14c:b0:ade:484d:1518 with SMTP id a640c23a62f3a-adfad38b235mr948743466b.26.1750082044401;
        Mon, 16 Jun 2025 06:54:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec897a70bsm662748966b.154.2025.06.16.06.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:54:03 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 0/2] PM: domains: Detach on device_unbind_cleanup()
Date: Mon, 16 Jun 2025 16:53:55 +0300
Message-ID: <20250616135357.3929441-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the dev_pm_domain_detach() from platform bus remove and
adds it in device_unbind_cleanup() to avoid runtime resumming the device
after it was detached from its PM domain.

Please provide your feedback.

Thank you,
Claudiu

Changes in v4:
- added a flag in dev_pm_info that is saved in dev_pm_domain_attach()
  and used in device_unbind_cleanup()

Changes in v3:
- add devm_pm_domain_attach()

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach

Claudiu Beznea (2):
  PM: domains: Add domain detach_power_off state
  driver core: platform: Drop dev_pm_domain_detach()

 drivers/base/dd.c           | 2 ++
 drivers/base/platform.c     | 6 +-----
 drivers/base/power/common.c | 3 +++
 include/linux/pm.h          | 1 +
 4 files changed, 7 insertions(+), 5 deletions(-)

-- 
2.43.0


