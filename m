Return-Path: <linux-renesas-soc+bounces-27023-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90623D3A551
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF4B6300C151
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 10:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A14030C62D;
	Mon, 19 Jan 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ex9yCai2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhzShdW+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34DE30BB8E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819235; cv=none; b=R5+i1+BiDPvqrW3rvig2u9/l0a+MqAnqnVlw69WdfNOoMIn3Qfr/StT2WehoGIVbcDLUeHZmpaZ9AqszdbHJodxiC3lo2Sc9ZiTtz2e1p+jLj15PloM/spbwPLb6ziCyiD6wi9PAfFujt2gjYOoplTg8SzEvGoJukFE/ip1ZPic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819235; c=relaxed/simple;
	bh=iSlD7Dh/mbSNiQJOq0DMMW6/96hXXaA8D+ljD2AYSQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=prF9uzoHkLijox9g3wt3lnoWq6jJ592GPAvb879hYvS8itX19SVPOc9CZaNOf5nVP+80n03P5r2IM+o4QiEcuxDaXNUYUrMhV9NLeks2AHo/+1VwWzUNj0mdM73eghjVBkghM+HVt2dj/3pE0ZPmXeNFUcSNtxj8RCiLAmQG27k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ex9yCai2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhzShdW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90oXI228217
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUfXZM6AiYyNqMON5WUuZG
	EUwe4BPoqrVV35Lqaruik=; b=ex9yCai2MfTnTplGDoXVqEhON42NGGCsaM4L6G
	mCHZ18c0KyV+mODSNZn3WmtdGsTLrOfmUaCU+NhXkG7X1eTSsNf/TtTdzYdEjXzQ
	Cdzz4Zj0SptSY2ZeLLvvTxc76yzXYdqBmCi+5asKx3kclqx6TGxGzS59kfbnW2hT
	zGclV3ubYq8Vfn0iUoHoo9/Aoib2Qdj3OkhhnTnNcQWJm8n50RlkgfF8j2RkzyXz
	JGmgFsxdzjAHtSWfm9F5ZGM4mqfnyCYsTlGhd4tndPplrWftLo57Id9ELbuExTb7
	hg4GLa8wt0+COOuq/QSmuwmwOiiV2xwPEDe7eQx7zF/ZW5YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8m61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c277fe676eso1099321185a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819232; x=1769424032; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=OhzShdW+kLNtjFFBE7EfNlJGsB8dPAMEcozOc3vTVAErKFQumsi6fzucsAARrjj/R/
         hMeGLiga8ON7zfWrEjmHyzUOEsgpeP9sqdtXDg9HxxFiK//LNvM9PG5bdz4yO6+sGsQO
         e+DIRBcMJSAxv6qixb+JgGPPBQaa6RvLbiFNQ3ks2unpzIQP+YdyGM3RFiYpwmo4PuQc
         Tce24aeCwrCoQylz/hcS3WpLz0cVqTYV1T0NEZu5xAvUjGZq0PGv9qyAGvZ2YtCR2dEn
         zvMWUZZsdxz/zF+hJzbJmWV5DVAN9MUo9bzEbxpoaUIulEHdpcwgO8i+cKDl9G4Whi0s
         xRjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819232; x=1769424032;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUfXZM6AiYyNqMON5WUuZGEUwe4BPoqrVV35Lqaruik=;
        b=jdshciDIyN5pSRfDXfFOe9wbP5E2GQDpbzBQvgdP8Xnh3Y+N+IG8ruTudqzImakTBG
         nEPlWUygAO9aKbCF9ah8J/FDwVVNoJCSSGM1guHs0iSaHFb5nRvI9jhcXiI0vW3S1NE8
         lOoTSMKxi3MG7UL8wXS0fePT006eZidL3Rez3MMUV9rJ+IB1Gxn0yZDBcmHB8kn9y1pS
         fjDXZIle++rEvFM/0V/4PqVpxt7XaaN4iwN1XVbzQTujvVzow8dZ5sIJOjvbIgmoUxkO
         ug916Xdx3sFNh1BRzpKwCt6BQ4ZiaAWBMdtqeml3JDf7zyb+6AofNxQSlTIK8wDN1o5R
         p5qw==
X-Forwarded-Encrypted: i=1; AJvYcCV5WXt40GG2MOPKAxrUAbxrwy/PWKv9CUSjYkoYobIcqzy0/3lKIcEk8OPyCiZsnKpI+2M9Aa3wKBnLZoTH1NSZ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl+HThx3SnVHnEMN3tWkPuJPwGGbXSJmlb7sS1iII2XP1fMi7H
	Tr4XuE4aF3wq77FEceH3q8yoshzc76SidcflWV/6OomRTzFBi+Pp++K1ao73ZG9pJ5L0dPh1fP5
	hDD0vRaR/Lg2UbyzI8oGxX9eZyGMfMSv7ScZJwAqzSGJFqmjGOSj7wikFjk+ZoRb7SGeVK8jyUQ
	==
X-Gm-Gg: AY/fxX75cKjSbhbxeXINGOGn7LZttaZ0eYlDAYvj7UBPISXtMuCAVzg2zlhI3wNu8ag
	Nob6SwYklTV+ArHMGiDJaTC2hy52Mtk1VCbyBWZBPjjKLX6MOm1IpY1ZL/90TkQtOWST6PDnaz4
	PorBmw+83XfERQgijMyrnVg6Bp0sZCoto5muFVGqXIeMYRZ+2g31p8b7JZsF1kBB956sVbU7xn7
	44v8M+Fe65NDADzzh0BTipXytbkWHN+HjQm1a3jXiKlTxtWFWphLCqexhdfW2lBuMheVCrArWDl
	W2hXuPlwZUo6jH4AS6qZ9yJJYskZWnNdkw4dDPXVSyhi3Awl6JatT5PcPmeIP9zUO9Mvl1944hN
	K9IWPKrtgOCbcu44CUU0ZKCrwT5F6htWXCzyWHzC4
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531012485a.56.1768819231893;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
X-Received: by 2002:a05:620a:700d:b0:8c0:88f3:fac4 with SMTP id af79cd13be357-8c6a675aca6mr1531010485a.56.1768819231355;
        Mon, 19 Jan 2026 02:40:31 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/8] soc: remove direct accesses to of_root from
 drivers/soc/
Date: Mon, 19 Jan 2026 11:40:11 +0100
Message-Id: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAsKbmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0NL3eL8ZN38NN2i/PwSXXPzZAuzZFMTA0ODNCWgjoKi1LTMCrBp0bG
 1tQCEhjJgXQAAAA==
X-Change-ID: 20260119-soc-of-root-77c86c54010f
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iSlD7Dh/mbSNiQJOq0DMMW6/96hXXaA8D+ljD2AYSQQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoPyu5DMHSDKBFDw0X0fP2m0FmfzN/Sdyy3W
 dqzR8wP3oeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KDwAKCRAFnS7L/zaE
 w3nQD/0YIZZ70BVx/YX83RjrD4BVPwudBPlg1Tus56sNutGPvS6lJZKSCW4P0t4BaiGMZYu0uXx
 DwSJRVUSD1zKm4YMyapEElVBmfRU9coZHgJpytVECZ3rhW0J6UyQtwHt1NdxBjnnGtvLekAiCUi
 vXpZ7P4xjn8TGkDrrO1PZRCSsxtwNMqQO3EJchlBxdPTBpZTGRvAKkoqYunwCejG6n1270zn98f
 X7MuSTcMvRTNqCwDzrzE3XOyPd35CWzMzMc//cChVADri226wL5wnjLkcmzaHJl+475efNQP25e
 LgL+OK2N6W0HujWTQQ7wUX68ImeORNrNcitC/JR4yg5498se0k9EYa5fSzVG4vDL771xG+QgNTm
 EqRyPPYj5Lv9aKzRsk6qf3tq5lpJGg7len19ubZ0SCzH10IsH6KOPF0LOAUihIR8A5vHVMGa5Sk
 crm/fM9EtP+WfFiTbkIUnkno84RmJ/p+BkIG90rRr2+vHGY1fIDfzcxsSgrtLhfOijOCC40nSla
 Ow7zYwTN3NNbOY/Hr0nqgcIRGp0UX0vW+EAv5ci1cDzFvWJ6PqqONuFE6xGalVaCwYN1zW9qh3w
 b9SP7pAjgLY6XTwQNhpp+q6LC+rE352LHeeE5ZPYuj39akWt1a4R+s43+NJH+aC2ifjqziQF+jx
 yElJMXxuP6CE8iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -bcTGY4DWAYooepZUpcEYLv0tY-uBYKg
X-Proofpoint-GUID: -bcTGY4DWAYooepZUpcEYLv0tY-uBYKg
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e0a20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IK8FBO9Hk_FkL9rbzwgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfX0Jci+O2dWCrJ
 K4zAEjNJRI+EZ/XzgoEAJOJ4Hon+PFlICN6W4eCrgDeHFnLLhZIMfedvkDq/FXFDueOyV9d40m9
 SHf8nGGMNL32JL8F0OnmNC8dBuNwZ+UQcrmftuNuyWiBKacvAKlmmIS3v3NA4hg/+luAN5TPJw+
 AhjVbdBDLDf4XXbQRa4CwYRm8vs6A2MEPacA+kvUlLdrrW6tW2lb6UVulAcdaYr8MB4yyP0++wx
 RVI+UCdJOnxG9jAJvVE2WlfYRnM0+7Ecy2YA/h3+0MIiuV0i5pFtvQuTpVpg9flz7jEmuj63u96
 01LR2hVOAlnYrKadEQnFnlEDfUyWtTqI4BXQH/V8o4nZDw0oKENAzdrEfG9Bv28d8ybvT1ufgZU
 g1zKPHdntt6PsB4WslYhaWV/ybrtN3GAdX/A/vLEES3RdQQzhA721DBoCr/wgR4qrEx7KdaJfEw
 JeJINAlBCB8CsT338PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190086

linux/of.h declares a set of variables providing addresses of certain
key OF nodes. The pointers being variables can't profit from stubs
provided for when CONFIG_OF is disabled which means that drivers
accessing these variables can't profit from CONFIG_COMPILE_TEST=y
coverage.

There are drivers under drivers/soc/ that access the of_root node. This
series introduces a new OF helper for reading the machine compatible
string, exports an existing SoC helper that reads the machine string
from the root node and finally replaces all direct accesses to of_root
with new or already existing helper functions.

Merging strategy: other than patch 1, everything else can go via the SoC
tree. I suggest Rob taking patch 1 for v7.0 through the OF tree and the
rest can be picked up after v7.0-rc1 is tagged.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (8):
      of: provide of_machine_get_compatible()
      base: soc: order includes alphabetically
      base: soc: export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: renesas: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly

 drivers/base/soc.c                | 26 ++++++++++++++------------
 drivers/of/base.c                 | 13 +++++++++++++
 drivers/soc/fsl/guts.c            | 12 +++---------
 drivers/soc/imx/soc-imx8m.c       | 11 +++--------
 drivers/soc/imx/soc-imx9.c        |  4 ++--
 drivers/soc/renesas/renesas-soc.c |  7 ++++++-
 drivers/soc/sunxi/sunxi_mbus.c    |  2 +-
 include/linux/of.h                |  2 ++
 include/linux/sys_soc.h           | 10 ++++++++++
 9 files changed, 54 insertions(+), 33 deletions(-)
---
base-commit: 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
change-id: 20260119-soc-of-root-77c86c54010f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


