Return-Path: <linux-renesas-soc+bounces-7719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5429478D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 11:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03571C20E7F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2024 09:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256DE15350D;
	Mon,  5 Aug 2024 09:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IB+O7lsV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7844F137C37;
	Mon,  5 Aug 2024 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722851936; cv=none; b=S/omW57fmSSTwr8ejYNTd42GW24O8x2iy/rp/1ExEBQdnKxoTUqObjNTN0ft12oH5ekLDbZUBipfNtGWprQAqjTaXa+Ql+gWbSnvhzRfxE5GEzqhqhXGzwf0fY3oiz6MPGscLoCUriXshMa+ewqg+Zvsu9/kU85oUAn42HneJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722851936; c=relaxed/simple;
	bh=ckwt517yKxxVzlM8CcWV0s5Rgb+0zNWVAjvo9LJZJVQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UkGwbYfX8G2bizhxCl57Q1HoTuxepSPePN9c/b5xHRaIPrZJ00AQ4RSrdyZmUZ0AE3P9roRCaIrg5+aTHgpYrKdfuVDC55S+HQu6jNeutxjao2zUS+AOXQ7WkeOj5IoB/4PSWyu2l4pWTxnKduaaNtGvHJaur1CrbaWQ1LvZDbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IB+O7lsV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367963ea053so6926353f8f.2;
        Mon, 05 Aug 2024 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722851933; x=1723456733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BHoHEECpE5o9sWQnAe+eHRzHftTekmhO0P14uXbKEUM=;
        b=IB+O7lsVw71zTusD0VpJULzMuJf4+kLEeZXBpaVc0NwwXoqiMXuXV0rd3dqwcahFzl
         LkZqnEnmiqXR+jK0rpKCcoaBay2nuVCSgPuHOww0vWa0st4537ZxQYwX2Q7DUqXGVsAb
         t9T8ItfqU+SlFN2d2OjCpri2mlnK6DFnLDsv4W7padMOgJNg5ii6CraZ7oeIjd+CXxfd
         RuG/UmrgYV3RAYG0hQqvDULV+LgOQk1YCi+2fkOQ7dMjpQdJFAYPIZOzsOfwp2Vnvg1W
         AydRUgklnm96/Xx9RtkDCy5Dt0jSTXXs894SoeNjxRUUSCNkI7LNoY1LgWFOGiOK2NPb
         uOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722851933; x=1723456733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHoHEECpE5o9sWQnAe+eHRzHftTekmhO0P14uXbKEUM=;
        b=Ar+hKusBfMAC9leEiPv4/1seBNZVeI58VX1oFq1BFAjphpH1Fv+vJIT9NM3UN+u4Ot
         KKuguQCRAphg2suC/MPATi8zlxIoX3ySJpKr4eZVpCPbOnGh67NLyTKpy/MUjGinNwyB
         BFnB68Bj6wJsVZTWsMzY/xO2PfOQB1pOYVBkxJZZpEm9Q9AxuOcsfB27uxhydE9gv/fI
         6k7NRLNgfSPEbgrQDbYh/ml+6VPWOlLg9hzsGVrjCtvdLUHPwzPZOkhx7RDamuzbEGta
         eHjHGuUntVbJr2ohGqfArz+Mth1T60jSFdUMRFwDoHNc6l4TvCx61aaJSApX/P8Yw0gT
         biFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXan8O/USIwXB6BVtd3+O/ZULx73GbHg+NScvlg9fx5cvSy+pbOpn7+J989c9lxYujyj/HQyIePoQSysChwd86552do7DbMiLyqVOkBNzoOu+UOWLH8xNYvoTWq7mzAKoyZ1LKWm2Da
X-Gm-Message-State: AOJu0Yzkev2/yK3vB+SoZpa9yMAtDDCWYPF2g/HBKAvelVnpQKlIOxVM
	zSKRlh31LGoWiv1BUHCYx4A0hiVPg0WnJzyURtqs/jzf2HRMCIc/
X-Google-Smtp-Source: AGHT+IEzCM/xqDdmhrxhMEdZ7e0NV1MT+lwhzAh4Tu7K0402wLTOp+q7LKhWEz23m7PCLqn41822pA==
X-Received: by 2002:a05:6000:18c1:b0:368:3b5c:7a5d with SMTP id ffacd0b85a97d-36bbc0ff29bmr8419575f8f.20.1722851932377;
        Mon, 05 Aug 2024 02:58:52 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd01945fsm9254927f8f.41.2024.08.05.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:58:51 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: renesas: rzv2h-cpg: Fix undefined reference to r9a09g057_cpg_info
Date: Mon,  5 Aug 2024 10:58:42 +0100
Message-Id: <20240805095842.277792-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Address randconfig build issue where the linker reports an undefined
reference to `r9a09g057_cpg_info`. The error occurs when
CONFIG_CLK_R9A09G057 is not defined, leading to the inclusion of the
device match entry without the corresponding data. By adding a
preprocessor condition to the device match table, the entry for
r9a09g057 is included only when CONFIG_CLK_R9A09G057 is defined, thus
resolving the linker error.

Error message:
   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: drivers/clk/renesas/rzv2h-cpg.o:(.rodata+0xc0): undefined reference to `r9a09g057_cpg_info'
   clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408040932.SqrqyXGU-lkp@intel.com/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index a12720b4b498..504ee263919e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -829,10 +829,12 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id rzv2h_cpg_match[] = {
+#ifdef CONFIG_CLK_R9A09G057
 	{
 		.compatible = "renesas,r9a09g057-cpg",
 		.data = &r9a09g057_cpg_info,
 	},
+#endif
 	{ /* sentinel */ }
 };
 
-- 
2.34.1


