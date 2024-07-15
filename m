Return-Path: <linux-renesas-soc+bounces-7338-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACB393125F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 12:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6663B1F218EE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jul 2024 10:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97920188CA5;
	Mon, 15 Jul 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="koMEz510"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB0186E3C;
	Mon, 15 Jul 2024 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721039843; cv=none; b=HzXmFxKYfwg7el6WuLrCDftGspGIYbPL3WPmrXxWo43LTB9mUZQw4PqbR5+mUNUNRh3KgtMN3qOyMk8Y0sEcGpZGE8Ck0n5t5hpeEtm+J1muXRrXcrRFQu9ntLksQtv3ijvDhcf1eckrgf+ir69trXPM29LjK0NNlB6RZCr2TGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721039843; c=relaxed/simple;
	bh=e/ChqerirklhAli6n3y8FOc7mcwCV4vyLGJsStN+zYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NEBY4ISnmvnu2AOgpvwEZyWh61GAg3tw29x+9SmxWzBAbZron59UPowQwtnpjIKUb0HN9MyFtJm3l7h9N0Z7E3ZHZNldOLJ8NLerMDsP/twmlNeAXaI9yuMortk+5BSqquQacAzu4X46LTT5epHhZ26DIYZ0FGqoVUT2a5Av55M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=koMEz510; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52ea33671ffso4175818e87.3;
        Mon, 15 Jul 2024 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721039840; x=1721644640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QuOSh0mOiXYGRirjRUmIdDiiRk5HgV74pBqp70qNevY=;
        b=koMEz510NUZ2UI9IPVm1SQeynFBncyYUuk/dm9WsjjOfLYBBScZc0L4bGjRLA12rX1
         zt37f+g469ZPv/02AfsjYIV25t+XjxqJ99MKnlSyUTAseoS4RXQYnrx+A/l7Qg6NkM0r
         IrUK9W9wGtOwgibXZ/UEfjLiAHqz5lb5Lxa8lInbl+7C222aPrL8kDlW+uNlHq5BdS8t
         attKZFfPwIztEFKfPeVDRJX2JopXM1oYF5t4mLebKuLfctlnra0Uq7VQFJ+6BwI3yEQm
         DQBw4AHdbV2DjNWbrlXNKIUozVJhigzjDHC58uPYaE5Gj9IPjqAMn3kxhj04+uMqZdqk
         fnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721039840; x=1721644640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuOSh0mOiXYGRirjRUmIdDiiRk5HgV74pBqp70qNevY=;
        b=Cp6modC3RSlAfOeK7uNv3hOM+7hsmsqgCUDgumovbR5lx+r0YqJn+QMVTXRgI8MzWR
         M4h+4FqP0ozxmyk04CTCBPANUwGVrWt/X1Lqd20D21qLzM8EVBIZlxgBHlvLQjtf2DzS
         H7Vy6xjAopxK/VBOSb0qQhJ8YSwqfWOsdZeAOfJWwO+xn16O4p0O+vNMzsGU40vxbr5Z
         A0x32BiueVBy5Nczb//MlGJ4i8X5AKuxshWhh3zz6VbzkdsfRa5dxIZaKkRqpowhbWZd
         mdAPGGqIheHkilxZ857Bx6zIeFCU1HUVpePyv7EWq9gG/zjjKwpuTEU8/3plnJxYazNQ
         l9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGLWLXDEcgExp9pphOqODll8DEKf0XaHC2+XILwJiZuj/q4i+iCw7dFX7y9pjw/oqVpODQD91ibD74mT+muuOxGjPvbKYMq2YApfllXXvoz4ANPF4aQABGv3GE78zW2JJtF8fIIU23
X-Gm-Message-State: AOJu0Yx76wfmNxOKIiK26jsIwBlSPwLdvQwSiFHXhlM8b+Y05/balYDd
	XNDYVRV/FbFABJmPek/ZPIDe1gOWSmFC9XzupBlRCTVmk5GJMeug
X-Google-Smtp-Source: AGHT+IHa9H04Zqw9E6XpYe9VmaujmHV+eI/zxqEPsQ3I8Q4uTKklyeoQAs+F/meEE9Et4Z+hLbECPQ==
X-Received: by 2002:a05:6512:114c:b0:52c:e0bc:ca3a with SMTP id 2adb3069b0e04-52eb99d76a5mr12299055e87.64.1721039839688;
        Mon, 15 Jul 2024 03:37:19 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5edb454sm81153855e9.32.2024.07.15.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:37:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] clk: renesas: rzg2l-cpg: Refactor and simplify clock registration
Date: Mon, 15 Jul 2024 11:35:53 +0100
Message-Id: <20240715103555.507767-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

This patch series aims to refactor and simplify the clock registration
code in the Renesas RZ/G2L CPG (Clock Pulse Generator) driver. The
changes enhance consistency, simplify function signatures, and remove
redundant parameters, thereby improving maintainability and reducing
potential for errors.

v1->v2
- Propagate error code from rzg2l_cpg_pll_clk_register() if
  devm_clk_hw_register() fails
- Used devm_clk_hw_register_fixed_factor() for fixed factor clock
- Set error pointer in rzg2l_cpg_register_mod_clk() if
  devm_clk_hw_register() failed
- Squashed patches (2,3,4)/4 into single patch
- Dropped masking of parent clock with 0xffff
- Dropped creating local variable clks

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzg2l-cpg: Use devres API to register clocks
  clk: renesas: rzg2l-cpg: Refactor to use priv for clks and base in
    clock register functions

 drivers/clk/renesas/rzg2l-cpg.c | 72 +++++++++++++++++----------------
 1 file changed, 38 insertions(+), 34 deletions(-)

-- 
2.34.1


