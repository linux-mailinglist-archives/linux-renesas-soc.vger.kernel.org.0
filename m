Return-Path: <linux-renesas-soc+bounces-30106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id V1W1Lpk+wWlnRwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:22:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A442F2CE6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:22:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92DB330185C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C733AC0FB;
	Mon, 23 Mar 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbFh3hgl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PTnfJ+5G"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639BA3AC0E5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272094; cv=none; b=J/fmNkkqL6bQoSDN8C5d4obnFkSf7YXzMfgBluN9+OCNEGIrBYbC3+MA4DTxhsQrmppq1Z6Y0Us39WlYEeDxAFu9ceevSRw1CrGdp3CTmE5mqMLGr3sJXKSsxTLFDHsEHcsl/Y4dMVORgpn2auHN3Q0BQDPzPOblQKsWt4X52BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272094; c=relaxed/simple;
	bh=fbNtS/uHH7i+GRvFL8DqLP7cyjy46QeuA5MPj1IWrU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SQuHKlJMaajSvMXwSNBafaj7aLylMTXtBwyzA2d3028fHOFr2wzu4EI5UADMHdHgpAL1mU0sluaUr1xzJhvDLqoOUX3G/5JezajWj4+EYkrT7F7qYzKJk7sjmgYEunhEi145KOOet8NgnvVyaTbsFnjTG+/oFaeJRF0QIQRRjt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbFh3hgl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PTnfJ+5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ND7RN72191074
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=; b=UbFh3hgl5FsVLM3B
	sm9Hu660ve6IIfQnn+MGoS318CqYS7004KEd2g+JiA9TBEaTA4AB0j0lrCREtzTK
	kp3p52jOtl3brB+7oxWbJP9czqVkJv+xKREZbLHfPyhYe0WsvVIkBSGxQJ7eN7B6
	qsqJLuKNoy+TrSe3YWICA15j+LRpRXtNB0VpDVmg4CWyJxckQxM1H6mHKmNb9Cuf
	78cmsiKqXgvbA2rLptc0GxCuC9RRCGC1QS3kwslCdv43rXULLwrUUrnPWuNjrzFd
	gmMgsD9mM/i2z30FMJ34+tmBV1mmaZy5G4OeVNvu2sceQQutJBgE/BaThgn55pqc
	lxkS1g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jr2m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b274f94f8so311529261cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 06:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272091; x=1774876891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=PTnfJ+5G0afQCQuOf83BpZ1IsNC0ojOEVfmUhhdfucFQMKfo+H9tCJzLbtvrMxhb1p
         WxX/mPKhZ/A7lk0VqwUygn0Duo2pNu79nY0yCmDBANhAeeLia8qux5p1Hw9+aban6HDw
         FwFUumSDawTFRqOTKBwFbICeWzK1nFFIuedXYIilVOXA9uUJaCSu5OoOtQFtzQ+2D7s/
         S3A+Z/wmjiL1WKXDF9A8m8/j8C/jrPI6CMi0vqtYHIWMU5ZRiEDNnJzocEwAta+MJEio
         nNR9GWUlEFIq4eA2tNTE+YUi8niAmnK/geaZzL1T1n12n6DTXuXFb4fwlcWiCh3LppKR
         m7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272091; x=1774876891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KMyUU4KR43zZozuK55Bh2YheZBvjhnscd/dIXb/Z85s=;
        b=FesajUmU94urrgLyOK25LHoftfjboAvX0skbR78VdsE9FkrJ+85Qv9Wpf1HyKOhmLQ
         EIeej5HJwhKgcQvPfhkp2wJkEodhz526ayCfxDmVNm+LGxDvXOCqB07BJBbZPBcIDUNB
         ib77ILqp1Ymp4lsPLvm0HNaxoiGIK86Pgu4puFX+/Ddf/iIjwyGDtky/Jz6MdLc5SaMW
         +5wyidH+QVA95FpgfFDidNNnwtnD5zi/hrXV3ruc43eIuWKjw/OuyWXUIbCHo6vxZcUA
         WCVKRMyHQZdPfb9WOfCUxtcfIld64VvnoNrGa4S4JLGw0lSKEJcG4kIOWI+PLNRba9Xg
         TSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0XxPAfA8l/tJ/hjjYECECbZOdMMk/VTpGRrVHLZ9M1OiKeS5B4YmPNFMDyU+YMU4T+xjpjjTY8nm5cyp94wSjyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeDm7VkGTJvrU0fnKqtA2D8nBHh4DcHxh2ppn7C7qNc3Cu/e1j
	FS9Mg11JQqx1rfnzjgeu88D38Yg4ZxooHPUcIKrfv0X38nRXi0TABwnEopXLLhZmtgks7JYlFhx
	rB/WCeptInt8eDUsgbjaJQajoLVqEB2o3Pc2bIyzCoR25zeJCeVMHMDVtjteQ1sLYfg8t4jEexA
	==
X-Gm-Gg: ATEYQzwCT8cNsJg2dG3bMwrlARW3IFyIHL971Xg5qZ46ugEEUTD9f2izbgbQpZ3fAYq
	Mbhz2kd3WNpCgZOi6CioeObTR9y7Sg1AT8ReePALuu7DAwpVu6mpZrz1Pp6yiF0wUsqPjuplrHa
	imwzFDJ+BZ/wK/TFQm9ph0JU7JSkrDcmJAEBZVJcOWIkUqSDZ3B1Br4K/4c4eCLZXS1I05PL4dC
	CCcV1VGz6ZEJT0UNj0y88MP7AxknSHuwL1YXrpNEOw2pd6fslPpWwER2/tl14lREo9o5xwRJhF3
	93sgq67hU4ubwvx9fsS6ZyHCFHAzlJsSSSE6EnpLvYREMVVexr3+EjusNmazPg8ZyVSd28ZqIBq
	AeThXl3cP5CDQ5PS+O8Vy7HSY0GiUM7tCgDA99yHelr7xRKoGANMT
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150309711cf.0.1774272090548;
        Mon, 23 Mar 2026 06:21:30 -0700 (PDT)
X-Received: by 2002:a05:622a:355:b0:50b:4262:763d with SMTP id d75a77b69052e-50b42628ac4mr150308571cf.0.1774272089775;
        Mon, 23 Mar 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:55 +0100
Subject: [PATCH net-next v10 3/6] net: stmmac: qcom-ethqos: wrap emac
 driver data in additional structure
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-3-79302b238a16@oss.qualcomm.com>
References: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-sa8255p-emac-v10-0-79302b238a16@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@kernel.org>,
        Radu Rendec <rrendec@redhat.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5840;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEjA6ztNoVJqA2fzdic1acw7AfUASpMj8dS/VFE3Oks=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5IjAVUbJgLZzOY99SxIeC1HEhMu1hNYF6zG
 HWHluc4O+yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SAAKCRAFnS7L/zaE
 ww2/D/wP/Ex5W2woGWfDOP2LjxhH1VUxu0Ohs5tocx+8/G6QG/C+4a2yI1IUhY87af7fFgWFFj2
 dAthXs1FtkgQKiCFv0F+vPVlLrKN5UqibTQYyxg9b1YoC4WJTO+YETC/JUyCNnFq+QLBFUiA89k
 5HWMANkFZ+7OhxrIVsMoPn6Q1gqkjZzxb3DS35OEOcj7iQMpYtH3P0FOwZfzK4i4Trp9zvUNaY7
 bF5AY5sD3sgyIyHO6STeWk6gIGHdS8JHNxd7e2Y1+1uKT5D3K08MAEO6vdEpgdyvOtbplZb2gez
 WuY7WKFO0gBEMZ8oSAucg2kVnuQLs9HaBXo1jBzfHzUsrULK7fKZfb/0VppKFtepnIqdPrTM625
 RzZL029h0ZKEm+uQmpj1eFszVW6RguALHttCvhNMkBm4pndSKmtENbx6vGDwTUsB9taEBBZQ2/c
 EcHM/H8PGRmPTZnLtEqsqQ9GsOlrLsVT0nVE7k5Ylxff9yc3cMDI+/BMiriP1r2jSVMX7/02/sD
 +2z37I71xy89qZy+laKZPj86GmdgE8S0iePy+g/IyXWsgTzD7ffAPEzN4GdG4ukCUi0W7aCupA0
 +JffBph4I5CUJzHPjC8EuCKpJutok1MxaV9G923sVU0quAwrq9GE8XI5erwKaP8PqKv7sFIN6XE
 u7wQ1WUZHJR5Ahw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: o0R74m56-B1PZ5k5EIE2pszQq55VZaSR
X-Proofpoint-ORIG-GUID: o0R74m56-B1PZ5k5EIE2pszQq55VZaSR
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c13e5b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=fYgtqwV50X64hY7jBhMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX+hqkVtiBpIYW
 qqdLeopziUntE9cgkxLm4mbq0mBGrz2XTkFKWDUH6NdgsHPeV5G0m1kVG3jIeZtCzacWCEmVgz1
 xwI9J6AUF7nLwCOUJyPRLKOnArsnWBniypjjIwjD8K6XrEAEaw7fdVSGF2O/BFwS/sbRH7rcMgH
 Jllau6P86eJBT9IhJV2LbbmVfUEIuPppUiVRy/hfNQanskf6gZv698BN43uEgU1GJDjPLzmHRF5
 5HgLImrSIoJI6S3Ek3LS7CsHqUF99kN4EOpSNZvoZEImD9ouildqOx42p/uiBQFakSQZPq8TeY5
 TyuOPbL6jvoGxWFUlOO/xdMp6XVEnpOU+Fa4R1d/vlSJP6Fi4Yvm30PM/rGQFq7bKa/TfCIrHww
 dQOzhJkas+77ydBvUq35FOx6OVhEStbgoW6P/jqENi4KiamuhpcBzFBhULv1ySSpEXmIC5J47so
 SJF2NaPVr4t+QjcTnbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30106-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[50];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 73A442F2CE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As the first step in enabling power domain support in the driver, we'll
split the device match data and runtime data structures into their
general and power-management-specific parts. To allow that: first wrap
the emac driver data in another layer which will later be expanded.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 52 +++++++++++++++-------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 66fd2ed2c2c8428694c07d89220d0e1608546791..8fda6c128117d7f5b1dece68c919f2a09a511210 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -97,6 +97,10 @@ struct ethqos_emac_driver_data {
 	bool needs_sgmii_loopback;
 };
 
+struct ethqos_emac_match_data {
+	const struct ethqos_emac_driver_data *drv_data;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
@@ -223,6 +227,10 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_qcs404_data = {
+	.drv_data = &emac_v2_3_0_data,
+};
+
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -239,6 +247,10 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.has_emac_ge_3 = false,
 };
 
+static const struct ethqos_emac_match_data emac_sm8150_data = {
+	.drv_data = &emac_v2_1_0_data,
+};
+
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -271,6 +283,10 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sc8280xp_data = {
+	.drv_data = &emac_v3_0_0_data,
+};
+
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x40c01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642c },
@@ -306,6 +322,10 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	},
 };
 
+static const struct ethqos_emac_match_data emac_sa8775p_data = {
+	.drv_data = &emac_v4_0_0_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -728,7 +748,8 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	const struct ethqos_emac_driver_data *data;
+	const struct ethqos_emac_driver_data *drv_data;
+	const struct ethqos_emac_match_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct device *dev = &pdev->dev;
@@ -778,13 +799,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to map rgmii resource\n");
 
 	data = device_get_match_data(dev);
-	ethqos->rgmii_por = data->rgmii_por;
-	ethqos->num_rgmii_por = data->num_rgmii_por;
-	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
-	ethqos->has_emac_ge_3 = data->has_emac_ge_3;
-	ethqos->needs_sgmii_loopback = data->needs_sgmii_loopback;
-
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
+	drv_data = data->drv_data;
+	ethqos->rgmii_por = drv_data->rgmii_por;
+	ethqos->num_rgmii_por = drv_data->num_rgmii_por;
+	ethqos->rgmii_config_loopback_en = drv_data->rgmii_config_loopback_en;
+	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
+	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
+
+	ethqos->link_clk = devm_clk_get(dev, drv_data->link_clk_name ?: "rgmii");
 	if (IS_ERR(ethqos->link_clk))
 		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
 				     "Failed to get link_clk\n");
@@ -815,14 +837,14 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
-		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
+		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
 	plat_dat->pmt = true;
 	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
 	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
-	if (data->dma_addr_width)
-		plat_dat->host_dma_width = data->dma_addr_width;
+	if (drv_data->dma_addr_width)
+		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
 	if (ethqos->serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
@@ -837,10 +859,10 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_ethqos_match[] = {
-	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
-	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
-	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
-	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},
+	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
+	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
+	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_ethqos_match);

-- 
2.47.3


