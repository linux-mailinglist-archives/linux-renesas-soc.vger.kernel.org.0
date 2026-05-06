Return-Path: <linux-renesas-soc+bounces-32104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FZMAICQ+mk4PwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32104-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 02:51:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9D64D50AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 02:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DF29300A3B0
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 00:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5527723535E;
	Wed,  6 May 2026 00:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZohWz6HQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4QpPJ8k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A816122D781
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778028632; cv=none; b=oqzbBNixp1gRrZmui3d1U4ti5gXJJS2ABaSO+MoUNU3NADnxMTVCW6z4XhrnFAmPtda3SlaDylkUj6KND1/VXadsDdwivYUqRcS1vytSvwdYpWuAZmr7gBtvz5Ee4kl4VFcMa9isovyxop09e0EcCwBAeB+rjZdArpnoqUbf02Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778028632; c=relaxed/simple;
	bh=zMeXAyyLpb1ycANNIw7NwRnIidpI1as921qDmQJS1JY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ph7ZEn4YakPVkRlJ9Hy9b3aH+aRORhqpGhaIFNw9jzSRkFaYEkYaOXBWz1IH4ODIulezYA1dfe82j3Ix7+F87Beh7P18XID4Fo8lU8U9E8+NuiiIMqxTmwMPYss89j21zeVVudKx1aC4b3Y8zu35gOKbOVS27rFEleKnOle5VtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZohWz6HQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4QpPJ8k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778028629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b9H8cYKTCyIKnl9+d/AL5JHJT5IYmUArCaFMH4v5EuY=;
	b=ZohWz6HQUllvYrwQGEODoMsIiQ3IY3+ACIHrwjzLt7LaVHKXDKqcWHSTZ9lir9SiDQDZmB
	b/jQW6qFvbPBB9ikCFxjYhr3F9jnJHYhJOnjB+Pf4b1qIajGNB43tnpw7SCulgAZxRfgSG
	HBs1ZwsXGyfyjkAkxaeQKnTdtKN0eaw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-IZGpcO_fNrmhA3M7Te2e_g-1; Tue, 05 May 2026 20:50:28 -0400
X-MC-Unique: IZGpcO_fNrmhA3M7Te2e_g-1
X-Mimecast-MFC-AGG-ID: IZGpcO_fNrmhA3M7Te2e_g_1778028628
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8f87d6ce659so1212838685a.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778028628; x=1778633428; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b9H8cYKTCyIKnl9+d/AL5JHJT5IYmUArCaFMH4v5EuY=;
        b=E4QpPJ8kLNMULdl1YUVfQ+6z8lKShLBKXd7TCIveG2890PqK9Mh7LgyYlTyyoTK2G5
         2SF+c2k+doCaAWqCQA7UOe3N25PlSAo/6/B5szG/SyIovtfDxb6IOP5ACS5UBqlbGXw/
         W8gApWSglPcBKSP4qIHNsxa1sGJGNeQQO5w+b0wHasU07ErS6CFFF45dEyLxenmFtHK0
         mtKT1785hYBCHQhdFxCEQkhFaD9iFGI/Vd5GAimENg9l4sUmAG3OBs0xa5uAeja/LCwa
         k1VpPs5eGR7SmcoFLFckkHr7QJCsg6RSCNcZT3JbhiqW1QrKPmh1UkyJtTfI1CRDOTqV
         umig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778028628; x=1778633428;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9H8cYKTCyIKnl9+d/AL5JHJT5IYmUArCaFMH4v5EuY=;
        b=p+jcLDEa5JceTzg9P1DM9LcBET5sRrC60syCLOSqMhMDYOgkPXo0ovCjK2j0Dvr2IS
         NL5MnWqOT1+n9XvU/GFMGEcmViIbUj4RvPj2pCFcU/A515jPAVkqm5RRT1BFip87CeYi
         oyIh9RXt4nTVGC+77IeG4/C2PjlSFiUfVjrmJnL1KfqBo1rl6AmkI4oZlOCIBIVhx/SE
         kb7SAdBtQWJwpcKZ6xoMD8+yxEbpqGqnMa6iJsh05BfXR4hYf/8WugeZ6q0xwCitolKH
         skT0zVLKcgsffMN5Di8O1tFw8UHEOGDtdcXY9j9/wYBlRlT8jIvsenBwR7Y5eg61zBnE
         mMwA==
X-Forwarded-Encrypted: i=1; AFNElJ/LXSu5XlVdtK9YyroQd7bn4iiViN4xa3ZGiIjydmRfR3y0A3eMnSERm78IBuIR9pVImincCgyKiiboPEQi8sU3KQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXUThPf4Hnjw+qCawBPOvaI7YKID+4E+p6Yd+6Rtkrbb5+lseO
	90kGvJsQ97BANZtxL/MKOSwDiw0s+Zo/AVcPi4OXgxlafBuLzm4I70zmaGl+W5UUwrVlmcXKF+Z
	5COO4oGEvuMwRFUuxEXALt7l8FgB7B1YdtLd5dBDrKHCdKRf5UCLrs+IFrodkFFbwGtZ5x1Tl
X-Gm-Gg: AeBDiesXIvHxQ/b6yBChegPxzvXSHKQbfkjBa7AvbZVDWAcoDn0Iepu9KkFru+gNPge
	ey1UaKU/lpA21LaS7PWawsT2+aTtxR8vvsP8+nte5T+4ds26vpbw5nZFave0D+sSH8FsR+avMUM
	bf7zHc0T8wiBomGZ0RysK9eAMx3oogFpgp4100Puc2chaHuPkBTLowuXSuF++6M1Yu1fENyHzMD
	V+AF9ynqYat8b9IQpiP+iT9nYTxE7PwM0GTHfvQXtOwtLi7oZRuyLHC0TwKzyipD23V5+QZlGFP
	MmY980kqV1MQVvvEMfvVKwSOEjS67JMV8+X2Sz+1JnD/GVC7I2KS2NmvYXyH7ncXUHIau/zBFu7
	6BBkviAbY2A6aOgd6+RBsa6UKfvXsjRmTDRxH/VeMhlAFoqRpL1lpgtiwtWOMtRs06qsW2NVE
X-Received: by 2002:a05:620a:454d:b0:8cd:7952:d449 with SMTP id af79cd13be357-904d5f00d9emr231850285a.29.1778028627928;
        Tue, 05 May 2026 17:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:454d:b0:8cd:7952:d449 with SMTP id af79cd13be357-904d5f00d9emr231848285a.29.1778028627449;
        Tue, 05 May 2026 17:50:27 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c91fb3bsm1464933385a.41.2026.05.05.17.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 17:50:26 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH v3 00/15] clk: introduce clk_determine_rate_noop() and
 update drivers to use it
Date: Tue, 05 May 2026 20:48:56 -0400
Message-Id: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDsQNVHpVYqLoH90aJvIREpBv
 LvB5bd476AMFWR6VgcpfpIlxYL2UdG0+riAZS6mxjSdccbx9HnzjB36lQhWv4NjShvXvXfWhn4
 w9UCl3hRB/vf5NZ7nBVsAcIVpAAAA
X-Change-ID: 20260505-clk-determine-rate-noop-17a544f78018
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Abel Vesa <abelvesa@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Anson Huang <anson.huang@nxp.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 arm-scmi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-pm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3477; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zMeXAyyLpb1ycANNIw7NwRnIidpI1as921qDmQJS1JY=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJ/TXBhDD/HJ+irfPCG5f8LBYvv8Dx9dmqr4NPkLyFFK
 ++kbGS41lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEFrEwMqxq53uRvrC91Ddt
 SpiPrVzUGZG/vn+yPrXy74upe2fVfJGRYcr2/5NeNj+qTdRbHh6S2B+gniyyo6Z0VsK7yHUStra
 VbAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Queue-Id: 5C9D64D50AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32104-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,kernel.org,pengutronix.de,gmail.com,lists.linux.dev,lists.infradead.org,glider.be,suse.com,linaro.org,samsung.com,arm.com,linux.alibaba.com,mediatek.com,collabora.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

There are some clocks where the determine_rate clk op is just an empty
function that returns 0. This can be either because the rounding is
managed by the firmware/hardware, or the clock is capable of any rate.
Let's add a new new shared function to clk.c named
clk_determine_rate_noop(), and update all of the drivers that have an
empty determine_rate() ops to use this new shared function.

The first patch in this series also includes a minor cleanup to
drivers/clk/imx/clk-scu.c. I included it as the first patch so it
doesn't get buried in the middle of this series. I change this same
driver later in the series to use clk_determine_rate_noop().

Changes since v2:
https://lore.kernel.org/all/20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com/
- Dropped the NOOP flag and just use a dedicated noop function.

Merge Strategy
--------------
All of this needs to be directly merged by Stephen as one series into
his tree. Subsystem maintainers: please leave a Reviewed-by or Acked-by
for Stephen. To reduce the noise, I am only CCing people on their
respective drivers.

Since there's only 3 drivers outside of drivers/clk that need to be
updated, I included them in this same series for completeness. These
should go through Stephen's tree as well.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (15):
      clk: imx: scu: drop redundant init.ops variable assignment
      clk: add clk_determine_rate_noop()
      clk: hisilicon: hi3660-stub: use clk_determine_rate_noop()
      clk: imx: scu: use clk_determine_rate_noop()
      clk: qcom: rpm: use clk_determine_rate_noop()
      clk: qcom: rpmh: use clk_determine_rate_noop()
      clk: qcom: smd-rpm: use clk_determine_rate_noop()
      clk: renesas: rzg2l-cpg: use clk_determine_rate_noop()
      clk: rp1: use clk_determine_rate_noop()
      clk: samsung: acpm: use clk_determine_rate_noop()
      clk: scpi: use clk_determine_rate_noop()
      clk: sprd: use clk_determine_rate_noop()
      phy: mediatek: phy-mtk-hdmi-mt2701: use clk_determine_rate_noop()
      pmdomain: mediatek: airoha: use clk_determine_rate_noop()
      pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()

 drivers/clk/clk-rp1.c                           |  8 +-------
 drivers/clk/clk-scpi.c                          | 14 +-------------
 drivers/clk/clk.c                               | 18 ++++++++++++++++++
 drivers/clk/hisilicon/clk-hi3660-stub.c         | 12 +-----------
 drivers/clk/imx/clk-scu.c                       | 24 +++---------------------
 drivers/clk/qcom/clk-rpm.c                      | 15 ++-------------
 drivers/clk/qcom/clk-rpmh.c                     |  8 +-------
 drivers/clk/qcom/clk-smd-rpm.c                  | 13 +------------
 drivers/clk/renesas/rzg2l-cpg.c                 |  8 +-------
 drivers/clk/samsung/clk-acpm.c                  | 14 +-------------
 drivers/clk/sprd/pll.c                          |  8 +-------
 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c      |  8 +-------
 drivers/pmdomain/mediatek/airoha-cpu-pmdomain.c |  8 +-------
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c    | 23 ++---------------------
 include/linux/clk-provider.h                    |  1 +
 15 files changed, 36 insertions(+), 146 deletions(-)
---
base-commit: 4cd074ae20bbcc293bbbce9163abe99d68ae6ae0
change-id: 20260505-clk-determine-rate-noop-17a544f78018

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


