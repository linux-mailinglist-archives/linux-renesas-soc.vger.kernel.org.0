Return-Path: <linux-renesas-soc+bounces-29473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGiPIwrzt2mfXQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:09:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CF329932F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C8703081815
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 12:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797E63939C0;
	Mon, 16 Mar 2026 12:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CHd/RzAk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ge5ZPYUr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4890393DC2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662738; cv=none; b=MMHIxQTBqFua0Wzvkz8qkdCWmdblXmIpodMZKtg+CaUhmCUkeBVVKAXPWdSDf2RS4wJ2l9elHFnFJBWkfwvDnYLJvQquaazsr07dAykDzfWIp3ORhE+yckwElWlSQtVGO0Z2bFKczaE98scZnTTjLcLT2qPVMxXvNuh+Gv9tb6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662738; c=relaxed/simple;
	bh=Y9SagpHtwSqLjLqYl4+F6GAhqKsdJGhPJiiBMRVaavA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ifidhAJb7iejo8D7BngCp8PEmdamFNGHi0EQnn0tko4Igk/6h6Ay37nnBE9QNH23YuJBm/vpQmnvdNFSJDClcACoxUKE13eRYqv+Mfsv/oBkdkIufOOxOznxlCYOfZyFs7Z6e218rsUwayONLenruCDj1DfAuKVBguxBs32TvU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CHd/RzAk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ge5ZPYUr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GBnZ9L3777662
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 12:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZTO8oEFgM9U9IXKc2x7wkL
	2nE65XsgEjr+eYsx8KzP0=; b=CHd/RzAkbeqYCeeBnwrKadFqVVT+izjbOh8IU0
	+i2q3Ll2H6RT/fHqi41I/b6TtTo56lZ5Jv5HloGZzrXmhiwaqdGKuyG5wZtdEFJF
	NwQ7wvCWKj98nGC8VwQG1gyJkYFjhJWsguqFoy6HDEluzpdTaRCqIhYO1NZo5/de
	T/6jf+u+6x6yADh06M5e1/cDtLlXBVAdlB12+cCJcWE553k9ZSiNwjA5dzSD1tUl
	7YvHfZwccw4//SNMQwHbR7FCERRouKm00fPG+OWnmRZSvFGbdZ05mTSGATt6SqpX
	qhtNZpyGP6Vdm5YBUzpIqaFAUmpwZAk2RoFyTnU6MgFzFL9g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7wey9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 12:05:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509007aea22so145477831cf.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773662735; x=1774267535; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTO8oEFgM9U9IXKc2x7wkL2nE65XsgEjr+eYsx8KzP0=;
        b=Ge5ZPYUrkaaA+Ghnl16tOpAYO5wTwZNi21E+uusKk40kpUj4RR6UMMedg1SuC5/j6l
         B9bmnPfPDaxaSsnzUApePTBYi8WWBca4qsQHh7CHKK3v+6nXARO6UH5nwUuHgOquOYnA
         pr9fGOTueahKqoaSOr12BLu/lo4PJxfnN9Zdw0iNw5odw+GPdxml6VvZEUdxz0ahdh2h
         w9fvSBnynZ8ZUb8QXgeiUQjVZicjfvLbmz9ldaadjUDmMLBGrNj4/h1vAlPISEWhurwm
         cQXfMRn+kquAlcyQ4Rxha6xBnmaL7icbIsjyt7lyjCV4mN97QaWr2QeUX9tQ5Pxp5e6q
         IKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662735; x=1774267535;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZTO8oEFgM9U9IXKc2x7wkL2nE65XsgEjr+eYsx8KzP0=;
        b=ZSeyw2S/f2G/zNIt4IDk2ALa0qG9cPy6AFjtSIjvHDXO36wLDuKSELq5n7jddPEv4Z
         8YgPniX5a7Yy63m8BZuwxeeJfiphtFS6WndlfgrS5RSrM4LXsJXAoNNete6FaD8qjpPp
         pFWENaiMtv79TusUh7SVHC+8yjMB/0L654DfHdMovKS2Joybs2dZp598C4mUpXZrjo7D
         U1K1o+HYexYxwl0JFcIaZ5sRQusKRF+BE/kQhYSwwpcw8l1O9M7rSfFn5CHl9ELPZs9m
         SKx9MsAQrZf6IOqFqANvYQd6cyH5zNFSszIDkNHrS+lEYgSGzTIwDd07wSKWh/T/0Dv+
         EsDA==
X-Forwarded-Encrypted: i=1; AJvYcCUh7U6oSNBvE6FYZgwc+hHhm66oD/mGogNMHckikqIipe4MkALIqBmh1f7eY0zSx6fg3X8B+0gpk/mUkp4bYQT1SA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt4Wj+sl76+FcUC9oPGpDUmkoYB+OMTVWaoQPl6PIjQLhyMKRD
	pgchYl/pJvhOx8uEFIYnRLY4GjSURpGaMhXSaAcX7baCfqdxmSFuzByNbywgmIXE+2gD+hVGAyQ
	G4/W3JotLgvGpz3KFF0HVh9choqrTZ/gk+zx2cdDseYkgUIXG4CbADNZsbaLvV7tklWDZOeILIg
	==
X-Gm-Gg: ATEYQzw8sGfzNqbJiv0oLTXpKAUuO1+eWdQKTxqgqiyP/2tj/57NC7BE32LKKjVl4Yo
	BpwZ9g7uXcHHdvfShLViiAmi3Kh/gk2uj/xrDNWoZFMDN2CgO7K+qPQtTY2F1RmkVgtZbW6f/2d
	rOkHyQw1YaMiQy4rBxkX5go/yt0uNImX2Yl6PjYOP32vs5XTzO7sUmanjXF7IDuuovexgzNcNYY
	p8iY+/AjX+DVrA+WTxUrSTi/51avEwWRgT5AEZqVW+4/eKSig8A+pBMsrj2CmiBWG66fAKetGuK
	dM8jo/3CIBvBMXL/sIqzCGqW8gbRlgX0UTAaLynHsdAobECkXvEOq9o8Y7l79uNsFRkoHORea6S
	95B7yzWVYbBIAW9P9N1a8YBYzrWoTCIxW9rrauiiTpPO129RsXfA=
X-Received: by 2002:a05:622a:188e:b0:509:44c3:5fed with SMTP id d75a77b69052e-50957e19ee3mr168189801cf.55.1773662734810;
        Mon, 16 Mar 2026 05:05:34 -0700 (PDT)
X-Received: by 2002:a05:622a:188e:b0:509:44c3:5fed with SMTP id d75a77b69052e-50957e19ee3mr168188921cf.55.1773662734122;
        Mon, 16 Mar 2026 05:05:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:45fe:3ba6:f90:d951])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm46468513f8f.34.2026.03.16.05.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:05:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH net-next v9 0/6] net: stmmac: qcom-ethqos: add support for
 SCMI power domains
Date: Mon, 16 Mar 2026 13:05:05 +0100
Message-Id: <20260316-qcom-sa8255p-emac-v9-0-c58934e76ff2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLxt2kC/3XRzW7CMAwH8FdBOS/Idj67E+8x7ZC2KUSCFpquY
 kK8+7xKG0gNl0iWk1/+Tm4ixzHFLN43NzHGOeU09FxUbxvRHEK/jzK1XAsCMuBAy0sznGQOnow
 5y3gKjfTaAikTGoMk+Nx5jF26LuaH6OMk+3idxCd3DilPw/i9XDbj0l/cCqHgzihBKgquajqM1
 vrdMfVhHLbDuF+4Wf0TCORKhGLCGWddXZGCUK8I/SCwON2smeictRbAuyaGFWGeiWIKwwRgq6I
 KoVN+PYh9EIRVibBMaO86BE/aYtwNOW8vX+HIW09bXn5fngELiPQK8DaoVtcUWq/WwJLE/SWxo
 MCWIMdQyxCggkrX7gXknyDEEuQZMp7I1fy/gL4A3e/3HwJbTX6iAgAA
X-Change-ID: 20250704-qcom-sa8255p-emac-8460235ac512
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
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5129;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y9SagpHtwSqLjLqYl4+F6GAhqKsdJGhPJiiBMRVaavA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpt/H8/X1k5rC93OtyTAwV3ieYmektEfP7MBb+n
 UWiYZZoia+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabfx/AAKCRAFnS7L/zaE
 wwZ1D/4xMTyYcGhAR1m/ZUSSROeAm18yb6kSHCx4q+HuqEOojcNBj8xZ0Zq96OYXOsewE/KlgAM
 AT6VxF7sU13r7Bd0R4czSppMwKQrSZ1O5cYE2Zq00bhWN6pEpzhXrLD2F/xclOFqvtG7qyo0V9D
 kkH0wQbgAv1niUQ3rmsHfpScQdwGfB5nTtK91G6rB2SmqashJ3fxt4ryAx9p9UfaQm6jVnS8GGt
 ANEh5zCeLGk537LhuPdPplywv6x+SilDVVS51qaHQFcdQgy1JNQsCgSJ4IeSqsVZx+PAtaLROuz
 tq6+5mh51TtnPJEOoFLPExNDboTjPxFdp7Qac5DFFSeCRedTWMnPeJ/64ttuzoPMl1vU2/V1jRz
 A51R03PY9Lg472nqY7VQvTmL+R+FlzB7xmYAh7MElCdroPM0OeZbJGsMBYdEckVoJx2gAUdUv7C
 4IBR78NgXL2NAo6DOWkETAvLjpNFfcZcpmpgl1dbqDBOJ3UoG1zrvcp/QEZGTP4n5EBoIF8WNxO
 WGUkBHq9qFWiZ5OStxtifR/3G0sPoFfAysqPSjkwfDnNpfjNLIkXwGdsFC/8S266yGB/fZvPHqA
 9qhdXCUQLd7RrWdEPWy29dIHcXVyz6sYUtuqko/h0HWpPeXExE7yt99G8y9KXwkdgbKYNl8WBVK
 xqYGG8BwBcw5sKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 2c1shUrIpzkHbVtlbtDIUfykwa_uQh11
X-Proofpoint-ORIG-GUID: 2c1shUrIpzkHbVtlbtDIUfykwa_uQh11
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7f20f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=PHq6YzTAAAAA:8
 a=11IwEMuB_qlnYAimh1cA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA5MiBTYWx0ZWRfXy/gR8Y2DpWgZ
 w5XngEMF2PMfwoS97dzCs9M8Zfljlrj1iWgw8mIY0b2E4SJ3HKM1gLgozCTjVOmIVFTBuyXJe17
 f7QrfRLjePLm5gWVhxNh9qmmYSZTKK5KzeK5phdxNjityFHZ0C5z5hVSSE3A1vcYgzDZcQsVqdg
 hc72348T9rtZBIVYncK4ngRs8oD3a+ceOtO1+vmnE8JCGuXOnHYOTmuusw3+eTmvx+5xS+anD9K
 XRkSwlDfzefwxwxog6zcTpdShbfotsy8s8JaK8Q4LQN9ZGwARanfsm3dDEnKw7Fd+IYrPsPWoBb
 75ArOpe7Hxl5wggvOgSksVnzeyKgENhry9l8Xztm10ZBCyEqPbyuwPGyj4M52Ks5U0G7jfmuUUH
 Fjaat8WsdWxuJNw+DYpi+GQxi69n3bjj7W7eQ7OS8gitjUe51c+j2llPxwU5I6eWMXO+hxmFDjl
 H7bV5YTHt8AyDAAaw7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,tenstorrent.com,lists.linux.dev,kernel.org,linaro.org,oss.qualcomm.com,googlemail.com,bp.renesas.com];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29473-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_GT_50(0.00)[53];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E6CF329932F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v9:
- Rebase on top of current linux-next again
- Link to v8: https://patch.msgid.link/20260311-qcom-sa8255p-emac-v8-0-58227bcf1018@oss.qualcomm.com

Changes in v8:
- Rebase on top of recent changes in linux-next which required an
  extensive rework
- Drop partial R-b tags
- Link to v7: https://patch.msgid.link/20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com

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
Bartosz Golaszewski (6):
      dt-bindings: net: qcom: document the ethqos device for SCMI-based systems
      net: stmmac: qcom-ethqos: use generic device properties
      net: stmmac: qcom-ethqos: wrap emac driver data in additional structure
      net: stmmac: qcom-ethqos: split power management fields into a separate structure
      net: stmmac: qcom-ethqos: split power management context into a separate struct
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
 .../bindings/net/qcom,sa8255p-ethqos.yaml          |  98 +++++
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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 401 +++++++++++++++++----
 26 files changed, 498 insertions(+), 72 deletions(-)
---
base-commit: dac1315bf558e4895665aa1c278fd30113ca119d
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


