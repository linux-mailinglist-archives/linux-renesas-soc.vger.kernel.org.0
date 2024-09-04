Return-Path: <linux-renesas-soc+bounces-8702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BFB96C099
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 16:32:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C60C1C223B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Sep 2024 14:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661CC1DEFD4;
	Wed,  4 Sep 2024 14:31:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7E1DCB37
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Sep 2024 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725460269; cv=none; b=hNtvSC21M4yfix1l9gcn5nSdBkfuwaNcYynTlFTCfmuQ7lDWzPZ1MD4wIgSRvAQ3QgCWYtJh+Sadmr5nZK4SaecvBJdol/tBuidvcyzatUt2pvP9ucCab5koMCeLfjNOfBFluESTq2Jo/Fhm2T1+8YVyiaGq94N8uijFpgEQALM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725460269; c=relaxed/simple;
	bh=P467mDUfuNo+4sLO1U0OGgnTSxfzQa2d9CPIR8FgBtk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oprbk+JjP0rPP7pZXKWl9PoOcgjeYLUac/LkhVYC1ue5FqGyKxil2MS9q70+Hw/FdsqVnAABEXN7AHipUU8HkeYjt19QAa12LRv60ZMwJCwwDpDKiiRXTsNIByUunJk7u6MDgUaEFaO3O0Yfz4HRfi6+aflUOzkX11KWT5njGm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ef52:68c5:eac1:f6b5])
	by andre.telenet-ops.be with cmsmtp
	id 8EWv2D00J3m5in101EWvaT; Wed, 04 Sep 2024 16:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slr24-0028JM-H1;
	Wed, 04 Sep 2024 16:30:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slr27-004My7-6y;
	Wed, 04 Sep 2024 16:30:55 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] pmdomain: core: Debug summary improvements
Date: Wed,  4 Sep 2024 16:30:44 +0200
Message-Id: <cover.1725459707.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Ulf,

This patch series improves the table formatting in the pm_genpd_summary
file in debugfs.

The first two patches are fixes and cleanups for commits in upstream.
On systems where performance_state is always zero, the first three
patches have no visible impact.

Thanks for your comments!

Geert Uytterhoeven (4):
  pmdomain: core: Harden inter-column space in debug summary
  pmdomain: core: Fix "managed by" alignment in debug summary
  pmdomain: core: Move mode_status_str()
  pmdomain: core: Reduce debug summary table width

 drivers/pmdomain/core.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

