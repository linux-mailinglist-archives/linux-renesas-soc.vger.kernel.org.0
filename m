Return-Path: <linux-renesas-soc+bounces-35133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RxjuOEbpVGoThAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:33:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B7D74BA3A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:33:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BlGTZ+QJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h7migrbJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F0E9301BA63
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 13:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3550442DA59;
	Mon, 13 Jul 2026 13:21:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B80C42B740
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948880; cv=none; b=r1Es17B+3ptES1JRiNkpOXfTzGk1SrF3SA/W8M9jM+G9+QZuZL3WLCrFST/PYLoQBR6FGvl5nSNJwAGMi+8cLuAVspkTJfnfOSuRVA6D5fJ8RFVwXzlhB42l6mYWiQ+1G8SstLf59x7ThJs+wD9p8AcsgBnijvEq92QiaaYAAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948880; c=relaxed/simple;
	bh=6McQp9b/ZuzsH4b6xE2Bu+mOLPKZAWdsYn2bXrph17c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LbgdGUHA6wf4wNMOWepnit/nTdxNeCNxcv0yKrqLBFX+PO/9Np+3NIMJoqaWlajAgc6XoNriMGHh8bXBr2lBvnCh+Ac6sGf1HHcBCuFIXPCXRz/+LpOtec2xT/K+tgD9ZE/tH2AdGzlL/UVlyi+LKbvEKhlE8YuB+FoSqq819w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlGTZ+QJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h7migrbJ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDwPh1428369
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=; b=BlGTZ+QJishjjSr3
	1JYkYZzkAxS5OQNHK6UN9ZZ4e+nOUozqG9XIGLXGsQtDhiKz3M+znG39hU1SACaP
	vRKfpITzZT2nb7c2w+JB2iDC/BF7nxkHXrwj3oGcZO6GZbgpjMFyvVWQLU/9QvVd
	6+s7ysGCcCl+AxGpCDKM+9KWpAjCnhrZ0GHZ0eVfoScolYT1aqd+G/HLM/P98dsx
	FH0ucpCvIWa4JAqUeCf28JRiNO2u+ffQH85z7ojWcY+ZDHZMAdbKJh1AhWWsqtRt
	ucbg36oW+Ozl2Ji6wS14M69dO7swdRd4NJ0ShEhkdm/wqsxsrZSkyFhLrGp/GT6a
	JfLJTA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcurn18c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 13:21:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so37723961cf.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 06:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783948876; x=1784553676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=;
        b=h7migrbJZVd7/SBHv6gW+8KLmYbaz0alCCBovQ5yk0ICnMlc2CJ47EhLN4k4UpeBJ6
         NPyFz06zizR5eKkVpOx4A0xBZFpg6Eh5wzl4gW6hQXcrUcm8FLTzfmqo8DpIisPgtcfx
         VqojwMStmvPwBPxZJDHSovVmPhizDjgn222W5SfR0UcmJP2pYARnoa06gnCMM/UVUUE3
         j2RC3cZDo9kOPtFP3R2pHu5RzdCrY78kI0G/Fejl9ogeDKAKwt3StMQ4pxcBwWNPQAxy
         /JkHbJI23KzzebCyS8hMLkKshJ9I2xDkMr06c8RYfmV0ms6bxOj5bWBJ10bjat9qlYZm
         khJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783948876; x=1784553676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cRz6RMAtUsr4ElixoQTyiHRXUjuFyumK233EdmGoYlE=;
        b=Q9dXN9GxGo+r+mebWHc56nk8kqtOYYAYvnS8jsB5F7+4gP+BJgPjEbdW3G9enSmn4f
         jkTV6Gih+VaMBXX77uX5BtPvBO4gkmKeS3Q4uRPh2WAyKB6K/L6TYz6NVa55tl43y4vf
         icl1cQw75KpTtfamfFXUtW8TyI6/XRrgmdxhfm01SnlIO77fSA/hewu6yqTUfn64P4dj
         l/DwpI79b4KUjoZyR7d4wZC/9UzZouuYZxATxrZPydr9Xy3+86ZuUoAj4CNrC6DG4ahv
         7mYq8yxIh84zJ2Fvjj1bBkekMOre8CvMjgQpc4j14wiYPBzxdUsSJBEyg0HY6cRQCp1P
         jLig==
X-Forwarded-Encrypted: i=1; AHgh+RroZ0iflMQ5sYk2xGy9nDCqkXZFWjro6reZxtmppFGdYeM4QRYX6PXu8rdvBO8I/cB+Kv1T+i151T/dwknAsLNGmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNX92fy5BhIWEWoS6RBm7B+P4SgvuvH7eX7Q/B89L5bBjPne0Y
	OSTaNfCcOjxjWjnEgeIMIO8YI8Hf6V6wKZ22MWTfPYE9y5lpwbGnRFJ8QtjmAnK702WrGBQvBYv
	E2gTU+rGM3gIMz+zcMGSfuw0l7uhSRpm4LmU8nmeiLebpMv+mw11P1JOC0q57ScWChmPcZ0KZ7Q
	==
X-Gm-Gg: AfdE7cn02BMaCX79mHvnzYQkhsm4H2AttRUofjPGZsTomQc2LL3YrPBd9dKZRi4Ix4N
	X5M7u7rYAVH+X+uW6vondH8sXOBfBRZYvY4PaZCLXDGV8z158zXlWu9VMxyHaxJJtWzR7tWE6oI
	nWpA1L6osgG5ZnTQbuSm4HCPC3DvWfnsmMrrj3Q8NtQc80BJnUyMgzO36ZkITSmKhUrDbBNzJPy
	2X3rafLMNUM5N8KZH9WeMRotPdIS9Um2vcnDMS35SQcBvMGT8wLXZG1qgbnqhyYMCBtOcLJKTse
	XZA0hhRnXKQxkXUSV65ckmJzyoFsxAIdooSe3G0QcSzg5F5naiHK7+hYImV/DXFV0chUCme0Xgs
	i50nU6F+b0PXYsRSV2RUCbc2bEVp396mK/KBvyXCC
X-Received: by 2002:a05:622a:5805:b0:51b:fc67:c738 with SMTP id d75a77b69052e-51cbf0e0847mr89640731cf.29.1783948875926;
        Mon, 13 Jul 2026 06:21:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5805:b0:51b:fc67:c738 with SMTP id d75a77b69052e-51cbf0e0847mr89640201cf.29.1783948875416;
        Mon, 13 Jul 2026 06:21:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3dcdsm354561715e9.3.2026.07.13.06.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:21:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:20:32 +0200
Subject: [PATCH net-next v13 03/10] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-sa8255p-emac-v13-3-119f8699ef8e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6867;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6McQp9b/ZuzsH4b6xE2Bu+mOLPKZAWdsYn2bXrph17c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOY2GgSE2+BJ9Hi0c9UpIYFQzAew4cab1THFX
 9E8f1kez0yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTmNgAKCRAFnS7L/zaE
 wxVsD/9fGr/P9g1CAqHPauMkw7O+VrRVDHUAJ/8hbsfFYCxXDcl9OEx61EFONLLAksNax977pI5
 Z/yl0bXTTHTgg2dcewTRXTWakDKOqmc9PufOJBeFJZM3j7vQ76T4BSB9m9l/tVhaQ+5QKxXxZEG
 qJvgeCbLAS04yp26coDMQaSNA8LDbfCKlLy9K4rZshOppJh6apggkq1uPtLULiZ+qtnc+Y2mYUL
 eYSoXQC9Tt0wqMu6pFwCZuGRPBEvzzxVo8C1WH3pyXL7Zg1e4wCodd+X5+DUitbUmkQo2UdDOtx
 74PGGgIhnlhFgqrt6oZlWkvMO9CH0RJbaC5g+n3SXkgGyLCpsX55UKGyoGEMJ72tO7fkEDnvx5h
 cCI20qJcrGcKIgy8SGBERFlqHuAEmKBqT5W51Yb/EFsZwt+d+NyKVVmdI5uwN/rt3k6DzTpqvnR
 J4YLetemAUcAejeindnRo5Inwn3REqxyNsDiQ0ROY/9oc+6q22clnx7d6QzAvB/Ey4jGmWkebRJ
 MJ8MwUl0mvWHcneN1xXAh8mj7rMjQAeUW7S/HuPdtYQjgpJtVSuKo+vVrpjhTsOCb1oQ4dFkDjE
 8CsRaDapvydtIxz+KOxCQ+vVrwjUWhCSfZn5DBtSMPET5HHCuuLxe8NVZ84xmLm0CuZ9KHOzCzx
 +AeQyBC0+fVj36A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: L28sMYVZ0do-c73MQkz1OanPcQ8ltay3
X-Authority-Analysis: v=2.4 cv=IcK3n2qa c=1 sm=1 tr=0 ts=6a54e64c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZvYg6ySBQLmwDIutsxAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfX3zeq4MAD407z
 tGzgYUh7+D0nkZbcRIwxmAwlUCaN4Jhg4oiDb08XVMTgmv+79DO3ZdkQ4rxVhl0jIfOry81wW4L
 l62F7xwXUoEVBT6F/XVYD2DcWFgoQQ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzOSBTYWx0ZWRfXyqQ8RsrbPfWl
 BbfR1nzHlZihy6ewwlZV3UHd4Bw5fIfDovzKkI4LCENA2ZV2hUUEtdCKHAc5AmgkadWRwkKkHmH
 YpVcKfRXyquttEAKfSJ86xF11fJy9ohyBtbbauJ3c7QF+UiMatvwq+FX00s+Q85tiLTQoRGudDr
 ciZJOrzgVTIAKIzXdGC57CqENOJaCcHQdBS5TJ78i4h2HNmBiG4kkl7ME6ir55N42dKaCCvV3aU
 bPxnwlSmdvi/jj9H2fjGWlnb9GMBTxPKR4pfX3aYnhDj5OQptCdEKe8jBreFtFiWv0DFJtIMeDO
 LvKn/Evf/zbkM3Se4bz1qqrvLHtopnevZ4eRmFFRNSY2ywqVwPg4IcgEJUCyDxBlGFjBEbHurjM
 4TQkwCQb4O4FscazMihuJ8eYRpmbKtSxWxJr8XvFSnfHOCDGPGCnVKtCPAv47y5Bx9LUDsRFLZw
 8I5Ops87hzJkdNqmZ0w==
X-Proofpoint-GUID: L28sMYVZ0do-c73MQkz1OanPcQ8ltay3
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35133-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be,rendec.net];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:radu@rendec.net,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linux.d
 ev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: E2B7D74BA3A

Implement support for the firmware-managed SGMII/SerDes PHY present on
Qualcomm platforms. Do this as a separate driver from the HLOS-managed
variant as they don't share almost any code.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/phy/qualcomm/Kconfig                   |  11 ++
 drivers/phy/qualcomm/Makefile                  |   1 +
 drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c | 165 +++++++++++++++++++++++++
 3 files changed, 177 insertions(+)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 60a0ead127fa9f08749e1bc686e15cc5eb341c28..a7cf348f6a7aa18e8b3f39f109b02ea672ae4177 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -232,3 +232,14 @@ config PHY_QCOM_SGMII_ETH
 	help
 	  Enable this to support the internal SerDes/SGMII PHY on various
 	  Qualcomm chipsets.
+
+config PHY_QCOM_SGMII_ETH_SCMI
+	tristate "Qualcomm DWMAC SGMII SerDes/PHY driver (firmware managed)"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	select PM
+	select PM_GENERIC_DOMAINS
+	help
+	  Enable this to support the internal SerDes/SGMII PHY on Qualcomm
+	  chipsets where the SerDes hardware (clocks and registers) is owned
+	  by the firmware.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index b71a6a0bed3f1489b1d07664ecd728f1db145986..032e582f2e1af96687484ce28aaba0c2ef73e754 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -25,3 +25,4 @@ obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
 obj-$(CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2)+= phy-qcom-snps-femto-v2.o
 obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)	+= phy-qcom-ipq806x-usb.o
 obj-$(CONFIG_PHY_QCOM_SGMII_ETH)	+= phy-qcom-sgmii-eth.o
+obj-$(CONFIG_PHY_QCOM_SGMII_ETH_SCMI)	+= phy-qcom-sgmii-eth-scmi.o
diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
new file mode 100644
index 0000000000000000000000000000000000000000..aa7ce9393b2853ee1bb248f4a5738974d41556ef
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth-scmi.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Firmware-managed variant of the Qualcomm DWMAC SGMII SerDes/PHY driver.
+ */
+
+#include <linux/delay.h>
+#include <linux/device-id/of.h>
+#include <linux/ethtool.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+struct qcom_dwmac_sgmii_phy_scmi {
+	unsigned int perf_state;
+};
+
+static int qcom_dwmac_sgmii_phy_scmi_power_on(struct phy *phy)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	ret = dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+	if (ret) {
+		pm_runtime_put(dev);
+		return ret;
+	}
+
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_power_off(struct phy *phy)
+{
+	struct device *dev = phy->dev.parent;
+
+	dev_pm_genpd_set_performance_state(dev, 0);
+	pm_runtime_put(dev);
+
+	return 0;
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_validate(struct phy *phy, enum phy_mode mode,
+					      int submode,
+					      union phy_configure_opts *opts)
+{
+	if (mode != PHY_MODE_ETHERNET)
+		return -EINVAL;
+
+	switch (submode) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_set_mode(struct phy *phy, enum phy_mode mode,
+					      int submode)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv = phy_get_drvdata(phy);
+	struct device *dev = phy->dev.parent;
+	int ret;
+
+	ret = qcom_dwmac_sgmii_phy_scmi_validate(phy, mode, submode, NULL);
+	if (ret)
+		return ret;
+
+	priv->perf_state = (submode == PHY_INTERFACE_MODE_2500BASEX) ?
+			   SPEED_2500 : SPEED_1000;
+
+	if (phy->power_count == 0)
+		return 0;
+
+	return dev_pm_genpd_set_performance_state(dev, priv->perf_state);
+}
+
+static const struct phy_ops qcom_dwmac_sgmii_phy_scmi_ops = {
+	.power_on	= qcom_dwmac_sgmii_phy_scmi_power_on,
+	.power_off	= qcom_dwmac_sgmii_phy_scmi_power_off,
+	.set_mode	= qcom_dwmac_sgmii_phy_scmi_set_mode,
+	.validate	= qcom_dwmac_sgmii_phy_scmi_validate,
+	.owner		= THIS_MODULE,
+};
+
+static void qcom_dwmac_sgmii_phy_scmi_runtime_disable(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_disable(dev);
+}
+
+static int qcom_dwmac_sgmii_phy_scmi_probe(struct platform_device *pdev)
+{
+	struct qcom_dwmac_sgmii_phy_scmi *priv;
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->perf_state = SPEED_1000;
+
+	/*
+	 * Enable runtime PM on the provider before creating the PHY so that the
+	 * PHY core enables runtime PM on the PHY device too. The single SCMI
+	 * power domain has already been attached to this device by the driver
+	 * core, so runtime PM votes propagate to firmware through the genpd
+	 * device link. No register or clock access is done here - firmware owns
+	 * the SerDes.
+	 */
+	pm_runtime_enable(dev);
+
+	ret = devm_add_action_or_reset(dev, qcom_dwmac_sgmii_phy_scmi_runtime_disable, dev);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, NULL, &qcom_dwmac_sgmii_phy_scmi_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy), "failed to create the phy\n");
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return dev_err_probe(dev, PTR_ERR(provider),
+				     "failed to register the PHY provider\n");
+
+	return 0;
+}
+
+static const struct of_device_id qcom_dwmac_sgmii_phy_scmi_of_match[] = {
+	{ .compatible = "qcom,sa8255p-dwmac-sgmii-phy" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qcom_dwmac_sgmii_phy_scmi_of_match);
+
+static struct platform_driver qcom_dwmac_sgmii_phy_scmi_driver = {
+	.probe	= qcom_dwmac_sgmii_phy_scmi_probe,
+	.driver = {
+		.name = "qcom-dwmac-sgmii-phy-scmi",
+		.of_match_table = qcom_dwmac_sgmii_phy_scmi_of_match,
+	},
+};
+module_platform_driver(qcom_dwmac_sgmii_phy_scmi_driver);
+
+MODULE_DESCRIPTION("Qualcomm DWMAC SGMII PHY driver (firmware managed)");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");
+MODULE_LICENSE("GPL");

-- 
2.47.3


