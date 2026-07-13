Return-Path: <linux-renesas-soc+bounces-35136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eDuqFEXoVGrIgwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:29:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE6074B97E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:29:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LuHB2Lnd;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IYtNuuix;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35136-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F243308AECB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62535431E7B;
	Mon, 13 Jul 2026 13:21:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED224307AE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948893; cv=none; b=Wn04FM1LgNxJIeV7PpUp2VVldb7khGLlgIWqpK43pu67w/dSV/yoyX8+bhzI/47BCufWPKSNzNHw7XGMKY+cqvJNspLlBSHFzTsN+AEbf7PW0ONSlLKzW4WqFvlRKwZWM5xI/2YnsdIt8V6nLBwJa91B9giJ9hVYvPZBKtVgOdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948893; c=relaxed/simple;
	bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iDCAjtK1sGaAgxCRmEg43w5x7XNzsu5DGQvEjs/ourAxarKPU5gg7F5muRvaNlIr4SFRaBd6E3nkjCMO89PoFqqlQ/2aek3El2cMW07Le0ltmxFfYSe4JOa8j9l4pz++zFsbL4GcaZsBP/k+qjdnPCkmSAmCH5zi/dRF54pF1So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LuHB2Lnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYtNuuix; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEBqn1429201
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=; b=LuHB2LndYAhekP/j
	qqI6yQ1IIvHllU+v/KZAuCsz8E37eSBJ/bOgI8R9w1HloRsQVR/lusbYFphVuRQM
	ncaLznaaOZ+jeHtIqKrsrzK5JCqgTsSRyhCO9cXFZgwr9o6k33sw7mmJQNrb8F7R
	EC4ky7JImgq3CLSrmd3sZh6HesP8U9IIKPPhXIVLimSmDCbIAaSlKexL3PW2Gt1C
	hNXMwOBmK4v7ZEV+ILuRuT4iStzoti5NGJ4uK+4650V8aLn42qktRa1uUbwOZImt
	XTpbLooToXh5GCa7hlWSVWrwLEgxHPy75kUR40ZOGYkjWYalZ4Im/4G8MWbtq+ES
	FVA8Ng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn18df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a87ef9713so44411341cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948889; x=1784553689; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=IYtNuuix/FNb7c2bLQuiwUyw2ZI8QxwPYCHGXO4uO9A5fTCHQPL02Z4YKjKWUyNfno
         GcUFC+peRFkGD1EiElrOezGWx2ktQwJ23DUEXMup1IX0Q6z3Vlaof+6Nz03iRJbm5yTS
         x+K2jGRhOlON6QSum6ot1LL0Fr0vaBID+ZWpVfdThHDvctE2kLL/qWhnXnobHwBkUg4M
         kpjqO0w6ElHqHRZqZeFiCCIHL51X0FhA+bhs0QZhl7i3JhQvqojsWf1w2TT2AjTx2w/i
         lxP5bAOuWzVv5uA/AQem5bZoRQfatvfO79JYKJ7LMHe32clvsmv5MLcLUi4ZdauDg2l9
         ltAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948889; x=1784553689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxQCdrmRWkrqzTZlKUuS543ZF8H8KMBQQnBga75zxC8=;
        b=Xw4gf9PzJqLI+gvaYLN71Youc8y0pbYdIILFPseywJ6nQWbsvWj9D37R0qbSmzPiUw
         ma5Tx9ZXl7P9GUQ1kACv+lx1+Sczef+YVIy8BdaDcwxXJLuhehdU0LVKv30ETk8G7Mb7
         jAOHI9imlx464n6SKlSp/5umptcqyK5a1xQulvE869R0BFmTAQMZvLmEN9SpfQbj0rUR
         Za8rcwlrhK3SnyKQzFAe4C1Fd+t+OC4g58D9XOpKt1zgYKRXCK3LL1w27aO2KyCwKRaK
         yNk08MCHcUBydj4LVbV3b9uFq3idWbg+XeFnZJJeURqskxIPTb/qT8P6I1UBjhKvOY0a
         3e8w==
X-Forwarded-Encrypted: i=1; AHgh+RqQwMwy1jCIUSH7y5pKnqNw6sZa0yW75kpDTOOkcqn/j1SrCgHHLUe8qhPo3Hnld8JXCEzWUgMuHCVLaZw2YO3X0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzypt5z+c1dW10Soy3rERaGq0UhjFM3/bdPp2VFpTEaw2xE7yZo
	AEYGwjqH7cWU6ollGXtSpTSGnDagalImX8Na24btTHsvjHvruEvnMrYOEYmEQx8xHTwGlyjobQj
	H81WtdCKfHsFDNTjfE+kg2sAo+kDgHahtiQ+BJLasw4O87LPYVq29YbT8WrU2bLbqejXWUeYz+A
	==
X-Gm-Gg: AfdE7clFJHjhR0fjzz3V6CgBhf5gEg8R0gmM3ArrICsSZ1TFFvWJ0O7avobghGhpa25
	uub7UMDDj4MHK1FdQsi+D/MQQzWC15DIsmajHzIhLk+82UXbZp2pV9rgj3sRSn9z/gWjubPzhZ8
	t57XSBQwoKmdrHeDhTAUGcJwYdkdQJMZtWfmvzuoJawPVXrENFzu10kXSXRzNVF2Se0+64PejiS
	LFQpCirXeR8jjoObJjBFoCPJ28X+DfQJv22VDq9W4/U9Uvg0iItdf27hJxJtWe6oy+bWAjbd6Wi
	Z/ufD5W8Vk1LkvZCaKtf+VGF8ZpsqKmNsHhda7iJIIJrTPW/l8Gzi4EaVL90tZ6N0A06huRpotj
	VwwkkgoWwDYCXVPRsb+h2uzfPYj62OW4gbbB+0iYD
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141764271cf.19.1783948889498;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
X-Received: by 2002:ac8:59c1:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-51caa0bb46fmr141763741cf.19.1783948889084;
        Mon, 13 Jul 2026 06:21:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:35 +0200
Subject: [PATCH net-next v13 06/10] net: stmmac: qcom-ethqos: update
 phy_mode to the resolved interface in mac_finish()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-6-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NA70xnk/UNTcZEimYYDwGN/0JGIaZCh/H15cO1NUAsU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY5/+vs2/qf6ixq4/oND2Zx6UG66WUho2k1N
 BESE3IZZ9yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmOQAKCRAFnS7L/zaE
 w287D/9ZdNDg6JWXdurG/2dzivQeLaVo/7EtsCSyerxef3uIlCFZXmkGtM9e5iwQwgajmvVUCn3
 JTuk3xBjg+Z1rKC1kB/R3MjBD8PhEW+E+xtyv0ZfJ0dLazOINtSW3GAlW8X8jCLTZTcdvwEFdzY
 KIC9IY/wiiZ8QSRR+AhHjb5oF9P7v6JqeoqmJjeOZtJfRdnWMv3WpoIwpkP7GEtoICT4ADSsMVw
 dZ7DKd/klrXJmNHOgxtCE3Sa/tiWHW37EyzPjzFDFIJcWktXMWkFucKsCab66xmA8dxOPc8oZCa
 J1xm+gim/rKwzek+BM1739EJ5i9AauUDha1WT5QrTL9P5+3SvZ4zNLwhomOEKkLoZghbp6Pbepc
 XYhKBRQQM4vu1cZJi7F5bb9E4ACR+buWVjXcCeDZANXlHHtlPmOHekz+wJ3Ua1YStpgBkEAzKk2
 dFiek2jbRDX7KFBUTDPBTBIRkqzc+Y7sXl/CwPYbMw8Afeddl8kY4dpRvzG29iFvQmjSVwHcAbe
 Lgkz6aIJy20PcDerwJKefrtBj6Uri6D3O1qhz/Z+7KvVbnD2CZq6zoC940lmSPJUt47jeAh1VDn
 Uu5E/R4SosFE1DGpvef7KgKjGkKrEm7yAWoep/YaYStb2OwTec/khkzbk+W6+0EYIeUbC+syBv2
 3gGFk01Yg1NAiWw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: JPVuIbnuSvbmlk3UW4ThPMK4JqVDf_3f
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54e65a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=fYsbkC7JaC8eFfGKQicA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX0JFK0zFkhDcl
 C+xMBof5TUJxlFakCMhICWt3j5M7tZCHW1O1gUP+aU4GqJFw7vS2nNmtbTCsXSqmMnuXX8tYFZy
 TYjZuZnMEY+b4vhG13U3rtbUz2g1uRo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX1IOh6yibQ3Ru
 bahscCQ6ccubcugQGuNYRujJ9LjRc6i+6brPKYD+WRgAdXqLtD8mGyaNHmAfwseli+Pvxp0ylk+
 b4lmYwVaArABQ/0JsAs9WhNQBcRPhfuXXr+rv09esWO5HWdYSIJgLoik2WPQYVxWtboIV9APLB2
 UEsEDuQ8SplkiX0LLIbYuBc3XZhXCtDLCP2xLTHu9FsazVNPYVakCfb2TGu/iDa3pWvE8Q+JZsj
 4XJeJRpZgtwZ0s9gje27IqjCQNMVKy0ezzAIt4LaTZ0pZFMmR17u5mFnEnW9NxheAmzuD4lZ+yw
 7oKQdE5qBYgnr6Ylwyk4yG+kGyWqAwdoh6OmkzdPHNg7AxFE+H17hAGw4Cz1DEDdqaNfCygR5AS
 lTH/eRPxWtVm+bJfKH7auS9qVcFKjwGBBuq/aAQKSXAUtwzGdceQHtuflXKPdduiwxS7qi6fvyN
 rZMNUkEAC0wmEMbXkhQ==
X-Proofpoint-GUID: JPVuIbnuSvbmlk3UW4ThPMK4JqVDf_3f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130139
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35136-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: BFE6074B97E

ethqos->phy_mode is read by serdes_powerup() and
qcom_ethqos_set_sgmii_loopback() to configure the SerDes and its
wrapper for the correct interface. It is set once at probe from the DT
phy-mode property and never updated.

phylink resolves the actual runtime interface and passes it to the
mac_finish() callback. On platforms that only ever operate at one speed
these two values are always the same, but when the interface changes
at runtime - for example switching between SGMII and 2500BASE-X — the
stored value becomes stale. The next serdes_powerup() call, on
a subsequent link cycle, then reinitialises the SerDes to the wrong mode.

Update ethqos->phy_mode from the interface argument in
ethqos_mac_finish_serdes() so that it always reflects the last
resolved interface.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 47b70b5e706f221c01f1c0ae3b1acafae6641165..9d19203ae4bd7dc17aca068f5eb88ff830e4e906 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -632,6 +632,12 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	struct qcom_ethqos *ethqos = priv;
 	int ret = 0;
 
+	/* The interface mode is only known once phylink has resolved it and
+	 * may change at runtime, so keep it in sync for later
+	 * serdes_powerup()/serdes_powerdown() calls.
+	 */
+	ethqos->phy_mode = interface;
+
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||

-- 
2.47.3


