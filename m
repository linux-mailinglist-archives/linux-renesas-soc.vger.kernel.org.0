Return-Path: <linux-renesas-soc+bounces-28982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gN5KCzn4qmlxZAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 16:52:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A339B224455
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 16:52:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 175DD30CBDC6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 15:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650713B95FC;
	Fri,  6 Mar 2026 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZfYEMdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gl5LwlHS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA9B36C9F8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 15:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812027; cv=none; b=MqaOmRPKlM5edkIrL9CC/IsPjV2CXVgwggbw3X6A0CeSzuykwjQKODvitbgWFXDZ/1XQqOJWaXte5pr+YuBZV3hgixBVRm4ywDd87qSz5ZzateVYJmh0n4oxNvyPp+7ZhFeowJj3Pb0bg1gob6zIR4bxbMuQjVR+QoKH+MEgqXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812027; c=relaxed/simple;
	bh=9XdbdEuY3r56nFysWw/+z8F36Fo03OLGA684GE1V7LQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k8l5BMKUJ5n72TNftVS8UF56+FZin2kGG/PnSuMj5W+4zqAh27LlvBN4wpJmJPxWqqV0UFho0+NJSsZ7OACbQkQ1S5OY9nQQtTzGWakqiEiRenqEYmTzR47REdhKUolyOCWGNJqDkRTp2UFSb/CWgQC1typ5dH8a8Lo9yv0NnsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZfYEMdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gl5LwlHS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT7Jm026041
	for <linux-renesas-soc@vger.kernel.org>; Fri, 6 Mar 2026 15:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s7+GDpIdG2iguwUQE64k+F
	OMd/bKz4kwkSaaXmdUVO0=; b=VZfYEMdQLwm3iGAC8DTJYKn9ThXfpZxkj8H5O9
	CxC6cxr3IAoE1xNSfDYa4MPhmG6nCTd+gUJmCMhCaV/RU0LiRWTkJ7hHrS+AULiw
	OaBh1VseKUHqqHAGdPDpFybbsMTxBeDzf3sU6AppYKVicsaAljTT99rK/1zp+DMJ
	QFh6FPfkB83m9Nu8o2CxdxQUnlQwm+8gOK/GIYGv2LpH1oM8ASFq+ESsbB2SsDD7
	1WKZykouR/FN9jI6kUmrg7iBn/w8kxjL+Zr842gMr6ckoywG0wngMn+3CL6WSPFD
	D8FblqQjRiKAp1YWk+n9mSbHqJhp7bf835XLtHl0xj4RdhrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqgp43cyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 15:47:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cff1da5so4910305785a.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 07:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812024; x=1773416824; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
        b=gl5LwlHSeKk/BrEmC6VhtnWem6XH05oRowAc4+lgv4MhZtcaPkLlr+tkyd8qe6NdQM
         sM2P4eTqPLZCYCp+aYXLsUfgP3rzYl55YHtl+eqHTZ/IJLKVgNyocrlRz6UiDQO408/A
         YXzTVbeu0nAn1yh/6rZcXqxAYDS0F/OLrl/Zc6qcEar/7ODSxYiQco/voYmiy1rI+jVE
         +m+7P1ZMnwzp63Uiqe39dk4ehK5/pSFieiJeY381mfxf4zuW9twyc+bBMGwEsjOh2o27
         ifRbFdGE/X0tYPU8hzXbL4CnK7NsdbzxsSso7WK5fXCOJkg91DM+LxdMpMo+gG9dQlls
         47eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812024; x=1773416824;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7+GDpIdG2iguwUQE64k+FOMd/bKz4kwkSaaXmdUVO0=;
        b=NK9clLoqGQzl6sHj0ClLJT8EhIQcW92RF2jl/t3RG/IPcVfVixrxXKsE2EqvvTMKWK
         rku+4su1vPvZuxijaog9r10UbA6+a6SC254JNBErdoWJ7QDtl8WYOvoK1cvWC9VhhqIc
         g6KSd6MXhczaBSBsUvBvw4dj+o8nd5kN3Qyz0nbDHoNQB4g/6Ef3wtKQjDo+DMb9fq8E
         JuX/W9IHptyDNEMKo7/lV6E+V7v0kbQYmPkjprdZR4z3sDQobU/DoJDBxXrfszBc7+u4
         jCeZYlpHz7WJUgXC5ndATNCnTf7javEtjFx3ZDRdBqwxgIs3zK2V/Zg98ZnPWvm/2jSJ
         UFpw==
X-Forwarded-Encrypted: i=1; AJvYcCVR3ZyxJtETRcbKAAIAcpX9rm4Rl3qdv1F9ux+MwDOxQOa9Pb6l6vRrycDFb6p117lMKJrrf89VU+90sKrNfhC/UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDEIXq/I6ZPKnSK4R+onI7BTUTATLnYbD2wd26/V9x8GZKef/D
	Y/JWNfjuea8Uk7fcvKGHRo3ibL7ZRqmDbKxSGxEvpIN2PqF8RHvy16YWEGG90ofLsi3izUUfXr8
	soUCRz8hkJLgOLvdhWCWSLvnKA5jOZ8wFeWmMrSNpcltu+JV0Ct0XVDTezbz8HaQ21fS6w0PbRA
	==
X-Gm-Gg: ATEYQzwllvpWDQbvbKOK+Y+l7FxiUWmmAMcXkddX50Pifq4Uorwh9d8Ce2NEE0IFa9P
	47FYjzazzqv60/JDw/i4zggx/PVa1PCsPXNBG0kmPr/PUoTJ9Xnur4qsUjtOGNwYFJqocGibFSP
	IveOwkNSnOQkiYfxeFWJn6f2Hj5v0JqaNjRaHhrF3rvhyX5liYzrsNK38SNIFkO2LXF2dt3r5LP
	Qc/M9BkseBMiRVbQRbgBsh7v4RZNl3CmsZEyNwQ2Dzf7s1aSHuQ/5PlQPzsX3AwPvdcgqo/TgSR
	W8po5qUdgsT1bZStu9XIHc8bS7bKCVa3k/Uy1CvEOKHDq6LoWXcysJd+FNMJqsAL/GJumi9CooZ
	yoLtJmzjrLusaynDAj2Fo9NRanUFTh8Ff8fQz9EMioKFXTAZ5oipu
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr316911385a.3.1772812023129;
        Fri, 06 Mar 2026 07:47:03 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:8cd:6175:9b17 with SMTP id af79cd13be357-8cd6d324d9cmr316900985a.3.1772812022400;
        Fri, 06 Mar 2026 07:47:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Fri, 06 Mar 2026 16:46:38 +0100
Message-Id: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN72qmkC/3XQzW6DMAwA4Fepcl6QnX926ntMPRgIbaRC2oShT
 hXvvozDOgl2sWQ5/hz7ybJPwWf2fniy5OeQQxxLYt8OrL3QePY8dCVnAoQGC4rf2zjwTE5ofeN
 +oJY7ZUBITa1GwUrfLfk+PFbzg41+4qN/TOxUKpeQp5i+1mEzrvXVrRF23Bk5cCnI1m2P3hh3v
 IaRUqxiOq/cLH8JBGH3CFkIq62xTS0kULMh1IvA3e1mVYjeGmMAnG09bQj9l9j9hS4EYCe9JOq
 l2y5iXoTAeo8whVDO9ghOKIP+GHOu7p90LU+HqoSfyxfAAKL4D3CGZKcaQZ2TW+C0LMs3WLN6r
 xACAAA=
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4813;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9XdbdEuY3r56nFysWw/+z8F36Fo03OLGA684GE1V7LQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbl89SImz11xHcuz4WDVyxsJu7Xg04hSUq/w
 BshdqAyIB2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar25QAKCRAFnS7L/zaE
 w/ttD/9UXcdtgk6BPmYCk4u4YMb/6T+/x/SMFrWGNcnRTVeKZmKBx4XjiUEWNxvf5vdXE7bS7LI
 3pNu8sde/ehrP/o4h65JxnvK+daDpw2rs1rxMwbf8Osf2XcY4xBuLdhoUkfj6X2E7xkc7OCLDF5
 0GJcZkdvmaL/0qU2JQf1bsrSRnGrI0bz2c+oLTE3kEW2mzFJ3t8ZIHUR5Q8xrSeJubKdIJ9mDC5
 6mfHpHuReCcjyw49JAEkqKZAIhrqunr5JJ6dyIAWPIwqcxsdZ1aeOaBnQXpXnootXhGIm+PO93d
 kGukWxEniA2Gprewa2DHJdYLbCtTS3w5D7Fl3OSIZJ21wDu+kjUeI5SyziMbdj4Z7wXtrB+Jc+U
 Js61MNa07EM9v717I0ht1296Ag55084wrRRZngMtH40//I9x6VshC0VMEIRt9s23cCuV/bVoP2e
 5m+r5Kug4Vn1Jrov/zT/uyi3UU94Z1C8yl4WhipbO8JVGiAw8o+5sBtB+WJIJy7ucZbFs6MlCVa
 CjkVBLpUBQI0ypw49JdCOhl2qe+Kx5IJLBzuTrUxNgaZ4cV67SsTlP760yTMVxNmv67oU7ojW0l
 9InFvM/EOxvqQqfpGCJLI11zBLgGUzSx/uH5Uf5IyATrOA/Bv0VWr/3rEap3MqTV8KG7sMr5MBS
 fYcPCKLAprXrKvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8Q-ap8-L788MUBfia-_UlTYgsKeiOzX0
X-Authority-Analysis: v=2.4 cv=LegxKzfi c=1 sm=1 tr=0 ts=69aaf6f8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8 a=h7uu4O38hj_b6GN6T5YA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX+4RFjwp3Ob8P
 xzKvAKWW138liulLRxogDrrC0e/fTRZSJoBU9IUKzDBu08Hg4/muJgbrpCTq2b4zespRs84K0NL
 yLjW0liNBAK6IuHbct8BCdv4FXBRz3620E5u0UdGe9PIWCbXAigbWAi1cvKMWpwQ8qMOBqk7Hmf
 6SBfq1OkQXJlYbcJ10+vxH1eJzXy+pYiPFZW07APPTJefAnYm0S42AXOgrKggPMdokJ/TsciJp+
 KoHxNaJywWejZrOGwSUSN7tbOhpm8jZAx+L6Abf6omL1KSrY8GwF0AfSMaI1glKX/hj7K1viRnp
 CIZ0ylqNV7uTT/fry+HQ13078raRD/0Sejm0ivLD1tTXlAOHTeQu40idjALYRSlMExDmq6r4yrc
 jndqRpKWH1M3xRoPst0Lo0ADoonBx+7ZCAZlQwOSuvZ2uQVQ1rI7VHU+CsaSwBMYdhY9hPnsbGG
 lQ2C3cISPNj1CC3wnMw==
X-Proofpoint-GUID: 8Q-ap8-L788MUBfia-_UlTYgsKeiOzX0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146
X-Rspamd-Queue-Id: A339B224455
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,foss.st.com,st.com,synopsys.com,sholland.org,altera.com,linaro.org,baylibre.com,googlemail.com,pengutronix.de,oss.nxp.com,nxp.com,bootlin.com,bp.renesas.com,sntech.de,outlook.com,esmil.dk,starfivetech.com,mail.toshiba,glider.be,eswincomputing.com,intel.com,rock-chips.com,samsung.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28982-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email,armlinux.org.uk:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[78];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.971];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Restored the correct authorship after learning git uses .mailmap for
  the --author switch
- Rebased on top of changes from Russell
- Fixed resource management issues in error paths
- Link to v6: https://lore.kernel.org/r/20260112-qcom-sa8255p-emac-v6-0-86a3d4b2ad83@oss.qualcomm.com

Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org
- Link to v6: https://lore.kernel.org/r/20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com

Changes in v5:
- Name the DT binding document after the new compatbile
- Add missing space
- Make the power-domains limits stricter
- Link to v4: https://lore.kernel.org/r/20251104-qcom-sa8255p-emac-v4-0-f76660087cea@linaro.org

Changes in v4:
- Remove the phys property from the SCMI bindings
- Mark the power-domain-names property as required
- Set maxItems for power-domains to 1 for all existing bindings to
  maintain the current requirements after modifying the value in the
  top-level document
- Link to v3: https://lore.kernel.org/r/20251027-qcom-sa8255p-emac-v3-0-75767b9230ab@linaro.org

Changes in v3:
- Drop 'power' and 'perf' prefixes from power domain names
- Rebase on top of Russell's changes to dwmac
- Rebase on top of even more changes from Russell that are not yet
  in next (E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk)
- Link to v2: https://lore.kernel.org/all/20251008-qcom-sa8255p-emac-v2-0-92bc29309fce@linaro.org/

Changes in v2:
- Fix the power-domains property in DT bindings
- Rework the DT bindings example
- Drop the DTS patch, it will go upstream separately
- Link to v1: https://lore.kernel.org/r/20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org

---
Bartosz Golaszewski (7):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
      net: stmmac: qcom-ethqos: define a callback for setting the serdes speed
      net: stmmac: qcom-ethqos: add support for sa8255p

 .../bindings/net/allwinner,sun7i-a20-gmac.yaml     |   3 +
 .../bindings/net/altr,socfpga-stmmac.yaml          |   3 +
 .../bindings/net/amlogic,meson-dwmac.yaml          |   3 +
 .../devicetree/bindings/net/eswin,eic7700-eth.yaml |   3 +
 .../devicetree/bindings/net/intel,dwmac-plat.yaml  |   3 +
 .../bindings/net/loongson,ls1b-gmac.yaml           |   3 +
 .../bindings/net/loongson,ls1c-emac.yaml           |   3 +
 .../devicetree/bindings/net/nxp,dwmac-imx.yaml     |   3 +
 .../devicetree/bindings/net/nxp,lpc1850-dwmac.yaml |   3 +
 .../devicetree/bindings/net/nxp,s32-dwmac.yaml     |   3 +
 .../devicetree/bindings/net/qcom,ethqos.yaml       |   3 +
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 ++++++
 .../devicetree/bindings/net/renesas,rzn1-gmac.yaml |   3 +
 .../bindings/net/renesas,rzv2h-gbeth.yaml          |   3 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   3 +
 .../devicetree/bindings/net/snps,dwmac.yaml        |   5 +-
 .../bindings/net/sophgo,cv1800b-dwmac.yaml         |   3 +
 .../bindings/net/sophgo,sg2044-dwmac.yaml          |   3 +
 .../bindings/net/starfive,jh7110-dwmac.yaml        |   3 +
 .../devicetree/bindings/net/stm32-dwmac.yaml       |   3 +
 .../devicetree/bindings/net/tesla,fsd-ethqos.yaml  |   3 +
 .../devicetree/bindings/net/thead,th1520-gmac.yaml |   3 +
 .../bindings/net/toshiba,visconti-dwmac.yaml       |   3 +
 MAINTAINERS                                        |   1 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig        |   2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 346 +++++++++++++++++----
 26 files changed, 453 insertions(+), 62 deletions(-)
---
base-commit: cfb9039037a5796e3880d225d657165f378bb2b6
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


