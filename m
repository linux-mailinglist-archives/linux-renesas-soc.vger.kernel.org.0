Return-Path: <linux-renesas-soc+bounces-35135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dRkoE7HqVGqMhAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:40:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A467374BBB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:40:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Qf8msRCz;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IlD2lOAY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35135-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9685934F5880
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04969431E48;
	Mon, 13 Jul 2026 13:21:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7019426D1E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948891; cv=none; b=WCHunI4X8YhZLYw6SnTdrvNmkN1eBPtKY/ZMq4cfnmvjVfb3XmzM1hOiumJkxSNDlhtzlHCRp+q6Bt0/GnGo2cTwBa7VMkuYWCmCkv8e5Xj9lE3Rw/dwM/CWYlBHPy2j425ZY26cfyjs2klgi0TFs7qvC4mkA5Bl1pb1bnNZsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948891; c=relaxed/simple;
	bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkVJgqNa4+ULDfrwwBaXYTgNblk5aMFNqY7YB6mttkXS8B3lmQ1vJGM/K+K+1Eetaa+1wAVJJmg5D22xn03ECkA9XiVXM8LFFvQ+9aV4Qzd/tkxBKmyhPO3EpJlebGc53TEpWxFQ/mZBHbd1H3Yg/wDA3LYLSQ8cfHgF4lAK+AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qf8msRCz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IlD2lOAY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE3G11561359
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=; b=Qf8msRCzFf3+tHNz
	SOrsHJEPxq0uRMP6T3kvWKfsmoQjWYm+Nj5IdZSgZkPNmsX+HEzLlh2JJ07ihf5N
	mko0DY98giBkts0M6oLnXVXDK86/6BcvurPiwX+0Oz4NdrJ0vvdVbea0tDnESH2l
	vnGrYeCsYkqpzINV+eybonxT8jHlzPGK/rI8qIfPFQ9/TN6FauU7+JfgvqwggXrZ
	HNoKHVWu1a+AZ4PauUxMwhZd2XCe/FTJ0guFq7zymqxbR8SKtOflyczwlMckFF7v
	6WOgxKJStJY3SWa/67PFYX2EcOi3J+BwVj2X6XiGuYy6jwpFyePLlGxSs+19WNFQ
	Erw5uQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3apcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so43671546d6.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948886; x=1784553686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=IlD2lOAYIpRsT/V4mfl7NH8HE1WIklUimmkGA1mvgvdKLx8mg2LpUxINdjIOAy+iPr
         FC0+NWueS+XufGGlSk5H0ZeguV1F7/jJJMJLH0DaJ1/J7p3bQoeCL/IevkqQhaDWfH6N
         FrCbI+/rwyvg5bqhRW7Cm3sAVCvXVIkpMTe5DUVk+En6WXzqElz8C4439URnfbCV96gV
         VYv2m/NUkFi2TCMVJobm5lnFI0zrqQ0+0JWI5/fcAjpXA4n7SuZewOFGO4rXzIkP+EWs
         9FSXgF8JKKIdVlQY8luGb3GNGzm9a7vxwnD64KmxC1ET0u2KO3j6HXscBsGqRQAGXasN
         assQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948886; x=1784553686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RyU4Ifafpyh/FLtyPoayXjzPbwMU/X5o2UFaqrYzldE=;
        b=ZDacigXu1/Lz5+gzdF5G8i5VKt6GpWBq92a7QSV91LpU7gc1VkvGIkM3ExpNoBhUJy
         +ATDs6kFEIDepoVHVuQZt+No7hAbWP+0WawWfkSOLAlfb9uFfkCD2kYqdrwjPfgNyPFY
         ABIy1t9B46aQW5TXNcY+RFMc8iTZ+NnG6N0reG1WgUHuMcfdmStWiVDguCYceCXvlKiJ
         /CA2TTr3Wbase5XuMxXFUJ6D3g/ReCXyiR6/Q0OGlkvgsCryEanFIeK0Kim/uB1qpgPl
         7cWLows1tDwhXJaQUBUIcyxjnu1ELludtLw669k5O+847QZ60AETm5g9S6V4SVwQ6pud
         MYag==
X-Forwarded-Encrypted: i=1; AHgh+RrFgZPeKPW3gg9UEdW84q/Mjoq/ywcOLn6i8/ZW1XxOlwVOuACcky1SrqFXTZ2Ij0ToU0vJ1vvwolT/KEWYmQQDPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFSbXoFjXI7E0WmYlFo7x5Wy5wtaCwj8aw4N6H0YFJJ17Oqj3
	m6P8Th1LZc1wT61lLL2CvynDwoFug472+c0L5bvElf+PikHjTw/GshI5WFfyMuE3Vz6JqTy41rU
	iLYG3Dfya+8fw4Zi7JCUUJ3nJj5wiaihkdMyL2EyJ0XcB7OQwe2Ca5xY6VFnrFQg87mogUQxLoQ
	==
X-Gm-Gg: AfdE7cmKuCedlWVEemXxT2DJHQ8E3Az1Km32Vw8saBfEnDpLG9iUfJwLeYh1J4tfK6o
	qo3oeilNGZiKryzXlGRyRyAMcc89pr6Bkv3lqh3KqXhBkVierEBJhSOROfXEUMHBjA+wIlUPfn1
	EaH2AjsbGoWDOqO4SPZZJwFS1MxY6uhxPEVD5ecNwjOjiLyoQnr2df0tU+MRk2KcxXM327ZRud7
	kgBPFPbHOj9KnQSGaAbf5DULszqH+XlGOJiqq7MrkwuI27Tpa1m5srTeNx61/tgrjHNIHMj4H5g
	SGnFJCBoBSZhA1LMZYjD6YSOAuDjWp4XDhQuBiS6Ccnj/41umv3nljXUf+SnDjsJ8G837LFYQxH
	cFhSsWMD239oQJX9be4RkelaGeVFku41mZBjeABoL
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033501cf.33.1783948886447;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
X-Received: by 2002:a05:622a:303:b0:51b:efbb:fbc with SMTP id d75a77b69052e-51cbf0d40a0mr86033231cf.33.1783948886012;
        Mon, 13 Jul 2026 06:21:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:34 +0200
Subject: [PATCH net-next v13 05/10] net: stmmac: qcom-ethqos: set serdes
 mode before powerup
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-5-119f8699ef8e@oss.qualcomm.com>
References: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-sa8255p-emac-v13-0-119f8699ef8e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1365;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rq+TDPdqhF6BqR973VgYSIdLvxRoWPIkY3OnfX0xzLQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY4z91onaKk8EZSNQidgZf3zEywv9nc+nEcm
 240LzBDxc6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOAAKCRAFnS7L/zaE
 w1ucD/4m4/PTLJO0XMbU6rkRzGWtB4Ml5ByIwYm518Uxusod+xBCfBe/O98uwt/UkUh3XGQ8ANN
 PIwNDFrrG8qsxCqfjFpvQxoZeidLrlPt6STp6j4p+gOVWdTto250bumWcxT/+P/vbSwzWLb8K2o
 6cFSLyIHA/KVYLxYYaUK4wesPOclMG6Ze7JPku0PdKxtQ/aYWPttEUv8xvzheabI+0AqsX3jARN
 dF82kntlPB75YooEAqaQSswWn8lhbTd9mV9gGsna95JJgpwYnG7IZABNDJykWuEYtHBgOI6m5ia
 VFokjS4/XDjphp4oPxdgqxO6UTVh4bdilWU7MaWdLs0AiC3oAUSSmoSZm7e8IrXx68LVIF6IqRX
 geK39OIcIChi4YwyEGny8GngvKdPtAEmsZwrJAuM4eecviRJIT/Qc4U+tn50CpYV8yQ7xjUwfK/
 D1QN1WSBE47QmmlUlzo08joi2AujLXtNCV0gXTaIHdx7njErkwIowCqaFIAMLsXwRWW8bl9hxC3
 CVsGSMrvXAGfbtG+MrMpEGMYwLuL9Hq/VuTaJn14J04bNn2FmNLIteRt7HIblRGQoZhRQSOEyB4
 F2MOTDosGkq0ICXPck1d/CoYelm5ME+EOJZSGFax3uvDX5Lqfafyjs5YHpzElofYwX0n6WI9Ojs
 uyMFYwSxO43PFPQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX0fzIMo29/Out
 tMZyo+VJ+32xqyRGtxuCnFMLfPKE0oqrLkvm7F8ULl8osx8LkBo2q+goc4SeNh9PSAIuW0qbzq/
 sPcAk4JaQuQul5PdzKUPt5yJ+/yx9WQP9IdKUlqwzdMSKAIKUiBSlElw4GHSPipYSuDZMG6sU04
 4qPOf/0rDvqj7/GTxrRthxtS6kqVAZnMmo6VJdYcNcvg7Hqq4attmv3zqpW6DjR8w5+y1q5au4y
 U2unFqXselQpKhBT21trI1k4Ut0HB/KGQ3WrfICit3VSIclTIfDHgeZGUSwelo2vENJArduoVyN
 P0rL3BPyf2A+g7rqQi4GYX6f45z+xHDxrwyfqLWe07cXj125Aaj20QRMB5Q2sNqOSuD/rUw7g1f
 gmKykf0qrF73Dz7gB+g/nv+L+48Lo8JRrdElQS8vAe7T6Ybw2fx5TPNPCT2y7t+rGh5pyE3xYBZ
 JQsnpvliDxrKugQteeQ==
X-Proofpoint-ORIG-GUID: BT7hVph3DE1nZsarrHs_NS6gdwye96-b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX9P00t1chXJ/H
 MxDqKRzPojDbi9JaZ0lZRuHywumlm0KEs5ZUAF+rDeh4wHQlPS7OxLFlIhm9Vfvekk8eWHv/wmT
 kG/Z9TzvZXskomWladSna+YGwKYqV1U=
X-Proofpoint-GUID: BT7hVph3DE1nZsarrHs_NS6gdwye96-b
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54e657 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lIIuVyqIMTwqdMfQNTsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35135-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A467374BBB7

Call phy_set_mode_ext() before phy_power_on() in
qcom_ethqos_serdes_powerup(). This is harmless for existing users but on
SCMI systems this is required for the PHY driver to select the right
performance level - which translates to the link speed. This is done
ahead of adding support for the firmware-managed EMAC on Qualcomm sa8255p.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ac7d6d3e205a1ab5b391def879d6f1033a0961b6..47b70b5e706f221c01f1c0ae3b1acafae6641165 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -601,10 +601,19 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	if (ret)
 		return ret;
 
+	ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+			       ethqos->phy_mode);
+	if (ret)
+		goto err_out;
+
 	ret = phy_power_on(ethqos->serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		goto err_out;
 
+	return 0;
+
+err_out:
+	phy_exit(ethqos->serdes_phy);
 	return ret;
 }
 

-- 
2.47.3


