Return-Path: <linux-renesas-soc+bounces-33673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8J44Ln3KJmpkkgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:58:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A24BF656DA5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Jun 2026 15:58:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ftPFlvSw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=b85ziiz2;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 80CA53024286
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2026 13:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7250D3C1F4B;
	Mon,  8 Jun 2026 13:55:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6AC3C3420
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jun 2026 13:55:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780926913; cv=none; b=tqw8q/zDDE/hP0rRV4uLw5sUqQB7czRrO226g0yykVM9FQ7Mt1fXy5FeCxuLJTElu0blVUgryuHp4WPeG8xsIuxqoykG9xkA5+Veg+bzNXd/lU6kGIHRCHWXQh2XM4xnhlPMAsXSmLAtI26f7hZvUBXU+iQdQ85PbRztlxC/xmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780926913; c=relaxed/simple;
	bh=1TEC0glULkibN4KdgZrT/r3Q3YTk2QahVA/FaQ9NL6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMdUssNy9dHo7dn0kWFIcZa+wyKf42Gc3eBruSvzgkhbaUqjSd3u2niU8juNag1mFPQ3suNdJGDz2DS5HViYwH1hBvGfWtkf6Ovx+VIJD9dar9wdtQZ6TyaoNorPz+Xs1tBMWRwBhYEO/MTD0VLqpd0HtzsiuLpBzRboxiv87cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftPFlvSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b85ziiz2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DR3Oj3763781
	for <linux-renesas-soc@vger.kernel.org>; Mon, 8 Jun 2026 13:55:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=; b=ftPFlvSwQeIcmroA
	XDd5yCj6CRUGTJPJc43DA7o1mB4Zt8RDsQD+8Y0JoueSjgyQCVwp/bTWe9cfhS0U
	UFGfSW2Qsac9po1OC8IxVaJ/Ptan1zu8thyCM2ZI6wwg9XlCB9jXg1TDsF+RCwWO
	HpnYLXsyv4w2wI3VOM84pAeojBnYwGDYnadIf8i+GFgTMzEBDhzhwKstIIuNfAUc
	i95hLNmdb4f87rZKTYgluUOT0y48Wy7Oeh0/9XhXx8qrnkZLF32sjLE4BTUbfSsF
	KX8+eSDG4EyPUXYScpeSNFxPPzRc2gX0ddG+y4ofLlgg6Q3gGkK5Ulak96FyMUPO
	NEmznw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8h0j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 13:55:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517a9f4b626so36460831cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780926910; x=1781531710; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=b85ziiz2/QK84G76ne/kFxp4EH+YInueatgCNhmDMhBnKb1jotrSc6ri/ZM1lvlQ+n
         cQs3FGvGsA2PSfxjtP383uW0MoGFdR+VhzYgNFgkHykVwvS4cn4IUqfIb3/kpd5F8+Xj
         4RDz94DRAtq0XCXb0B9YEgi9lBjZyP1K3iu+FD4R3lBMu76LGDSDiQpq1eDBbsULfqAr
         Dhyap9SRm0NGMVpEnEqatuQeSoWlB0tqzz3PqSwN1Kk2L2DIGrimk6cTz47NTp4jMlpZ
         YtYj6CeYQQun96m46TAl8Y0TMRwreSQnmwzSsDSNzYdHlf9RtywmAWQdcsqJ7sIiV760
         s8cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926910; x=1781531710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYAENU3bKN6fHyKKtSYTgWQl9v5OPWMHQrRWdi1Q+xg=;
        b=jgCIrjM0MzZBskeRMdyxtzICt7x0j/AIXPcoti4Mbhu1hiNeZSv6VybxB1vtgE0ULx
         q7OovzvftWzxImRJ1p3bU3+7QhxYxAjWoorOArMnk7vJS1E6ZSBTDZhXrlx21IF1p1W/
         aSiwFi28C/AUJ3T1KhcgcYIOb4o0zqScbWYt/K+/ee7z5LRpxBaRJNrBXFwXtOc586Qw
         V4xnQBntx6AsrzCmtbX+RkR+pOICLhXI2AxmdtHKKfpXqNPSXoi8NxqPstV/9IZ8B3AC
         RahgiEq+ew2zGETGpyoTEoqqqQUK02Ea4uyE+Hweh6BiCYnx8A1wZZlBMEkIYrbPnuNT
         nTdA==
X-Forwarded-Encrypted: i=1; AFNElJ/GYd/5ZfD9hxTFT1pI713JW3D8QJjEFyFKG3vYWWUKrCE3PNc0q8QmxUAQ4pVaU7FPsosln7QhYLNwdJUwYE+/Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCGz0H5Zut/WXNMQ8zerJdHZF7HdRFuKf101qGOHPMo6q6e32u
	ms+AUh6YVBEnJT5P9+141bVIRLrkmdfNCuiG3yuwzUbF7pK2/dwPSosPD+gv9DByQ/vBGtZlL51
	jOf8aiVmBq34c6hsBn8NjgAO2SirpC0+dkwrvCm9vfcq7xzi1bB6zt8Pn2mAmsg22wWJiKRa5cQ
	==
X-Gm-Gg: Acq92OE2joSxn6NiYbZv6BsjgAferfQXIWS3d1V4PbQ2KQMp4iI5AoNp19Q6mdzkTzN
	B+i2Xi8Ge6iO3obxYPYZxxMpD82tzPXCVwwVU9zB2JH4cD54PCbXdYQcF5aqA9VwcyzKzECUok3
	kbsvUrYGMgD3fRzh/38HxAizlJdUYbfttUpe0vJAPHCbJrwaCJBUrzQ9LnnKjDFh/p67GQO0F1s
	UvRL2O7rM8MkU/iUmb2YLoZ4H6w4CudAa6Nja3o/Txddv0lj1DWx21jwP1M2a+Fid8QRnQgJXot
	9kjhGdC6whgDj2whuBTTRB5x/5Dq1FOotASbEkkzadWZ7gRiJ7F5Hc0ZHh4mWz/lJTrZ73FtfXd
	3hKTgvcE7LdeUwPoTobEb76GUFsQBLzbpM+cZRvPKaGs2/Gby8K68ysc=
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233492011cf.30.1780926910310;
        Mon, 08 Jun 2026 06:55:10 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:517:6fb4:5796 with SMTP id d75a77b69052e-51795bcbd6dmr233491291cf.30.1780926909757;
        Mon, 08 Jun 2026 06:55:09 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.209.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39def5sm385972925e9.5.2026.06.08.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:55:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 15:54:17 +0200
Subject: [PATCH v2 4/4] ARM: dts: ti: Add specific compatibles for SCM conf
 nodes
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Jacky Huang <ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-omap@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6102;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1TEC0glULkibN4KdgZrT/r3Q3YTk2QahVA/FaQ9NL6E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqJsmr1TFF2JsnFS66lCU+8F+0p5qJHQWm/zbvh
 UkJEZ5dWPuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaibJqwAKCRDBN2bmhouD
 1w57D/9Om0+Ap30Qz61CKEnvch9Did/wqToFGxnJQ2JdOkEcVRs+TGjLUVktj/NMHJduyiKdC3H
 lvRaXHDPMR8luF/OqbQTvidsT53QwUYNkShjaM+gS55P4+JqH0KxtUBolOmJkWqwSNRgHdAY+Kx
 skRFzWFXkRZyyxp38XHyZA1dgD4TmF3I133R5s53OEpnCLOumMbl9i6/w6MC5YUj0LjMXDAFja8
 Z4wE6RVLg1vXq0aLT9VtDKIHjVc7DqzNSTxGKCJnYTyL3wxT5RrS8072zPpikKv597dy6XSf5r7
 vhWE8W31x92IsGmgSi/o8RyoLO1xxoigfrASyHElWB2FagqUhvjZvBGqfPuk6+W+3ReFqXIGh4D
 FzO4zxE7w9RXGsGUgLwZr5/0sPPogfOny6q/8tOFN2F5cex7JgkZIUFUyS+81GzbWoAez745GlC
 GBE+vXK/J4EH/gkdp4MvIepziyvEU1lWuxX9tqVl1e2vFzoV6BdJc/P1ZTFzlD0BgO481VMEs8I
 5YTZEc9Z3Lk3ifSt7azZoc7d9HMxorm+6PrdYBLX5YWEh2vAG1KgvI3e5HkcreiBj4pZgI7K2HI
 ilHvb9PY9Vgic3JVKyzxkr7EHYTu5J1B5Ey2SVC6mbf4FLetntazJNiFS8U1KUWGKCKo1/l+Mqq
 As+xdcBo5ObiP2g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzMiBTYWx0ZWRfX8tVH8i3DZ4ui
 PdAaQT0nSoxtQBckaiSIvawYTRmKUz5CGuFLyV5tNB3ErJgFQDBIft8Xwp4/BkSv/TCsLK4NhLD
 Z9MS1giNii6QOsbT0LqoWFwaU9ciPh4o2XxUKse8SolT0hLDP76kcZsggDBUrzBFufBXscuRYUe
 hH3825wBNk7bGsH3zzZzl19RhGSurYLwW6js7IYcg9d19vQh6jMJrOmbn83+NgAjgTT9+qx85qI
 aKaE4w3and+oKA/6FJMsyun7Ty8Rut4en9AHTJTwylClhHqGt1ROOnTzPMAwQ185t9LUTJfAPiT
 mhKTX3baqwdoSwOx6ALiHfdJp4AWf/Mp/LqUsGkBoTk1BTLGmHaRHXtB5GBBcCeqvKeecOvmxi6
 ozEkom8Jk7+O3MqUk0uK7s3KD4/I4sxHgQL2wFhF4xxHcSiY9NMOAq8w9iJXuNVdksRreW8oif2
 7loqEnUNj5AcW0rPuUA==
X-Proofpoint-ORIG-GUID: 5ba9xz6tSOm1QTP6yDIHYJN4iQD2qOF3
X-Proofpoint-GUID: 5ba9xz6tSOm1QTP6yDIHYJN4iQD2qOF3
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a26c9be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=bD1TNsHgvEXzglPpcYW9rQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=50gAi1W1AAAA:8 a=EUspDBNiAAAA:8 a=h0HYIqCiEIHQYu1o55gA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080132
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
	TAGGED_FROM(0.00)[bounces-33673-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,collabora.com,nuvoton.com,glider.be,sntech.de,iki.fi,kemnade.info,baylibre.com,atomide.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-omap@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kemnade.info:email];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A24BF656DA5

writing-bindings.rst rules dictate that "syscon" must come with a
specific compatible identifying the register layout.  Add specific
compatibles for these devices.

This also allows to solve a different problem: "syscon" is contradictory
to "simple-bus".  A system controller with registers having their own
functions is not really a trivial MMIO simple bus.  These two cannot be
used together, unless listed as an exception.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi | 2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi    | 2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi   | 2 +-
 arch/arm/boot/dts/ti/omap/omap2430.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi     | 2 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi  | 2 +-
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi  | 6 +++---
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index 89d16fcc773e..1e09d2b48925 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -308,7 +308,7 @@ am33xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am3352-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
index e08f356e71cb..30fcce33f4b7 100644
--- a/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am437x-l4.dtsi
@@ -301,7 +301,7 @@ am43xx_pinmux: pinmux@800 {
 				};
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,am4372-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm814x.dtsi b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
index 27d1f35a31fd..9e02bfa5c3a2 100644
--- a/arch/arm/boot/dts/ti/omap/dm814x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
@@ -432,7 +432,7 @@ control: control@140000 {
 				ranges = <0 0x140000 0x20000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dm814-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x800>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
index a1e0e904e0f0..ee0090f7aa64 100644
--- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
@@ -100,7 +100,7 @@ dm816x_pinmux: pinmux@800 {
 
 			/* Device Configuration Registers */
 			scm_conf: syscon@600 {
-				compatible = "syscon", "simple-bus";
+				compatible = "ti,dm8168-scm-conf", "syscon", "simple-bus";
 				reg = <0x600 0x110>;
 				#address-cells = <1>;
 				#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index c8d325b0f57b..9df7648c4b79 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -64,7 +64,7 @@ scm: scm@0 {
 				ranges = <0 0 0x2000>;
 
 				scm_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,dra7-scm-conf", "syscon", "simple-bus";
 					reg = <0x0 0x1400>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap2430.dtsi b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
index 222613d2a4d1..01bd471f9223 100644
--- a/arch/arm/boot/dts/ti/omap/omap2430.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap2430.dtsi
@@ -50,7 +50,7 @@ omap2430_pmx: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon",
+					compatible = "ti,omap2-scm-conf", "syscon",
 						     "simple-bus";
 					reg = <0x270 0x240>;
 					#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap3.dtsi b/arch/arm/boot/dts/ti/omap/omap3.dtsi
index 959069e24730..447736d2e53c 100644
--- a/arch/arm/boot/dts/ti/omap/omap3.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3.dtsi
@@ -116,7 +116,7 @@ omap3_pmx_core: pinmux@30 {
 				};
 
 				scm_conf: scm_conf@270 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap3-scm-conf", "syscon", "simple-bus";
 					reg = <0x270 0x330>;
 					#address-cells = <1>;
 					#size-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
index 4c78a0b28fab..c1afc49f456c 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4.dtsi
@@ -681,7 +681,7 @@ omap4_pmx_core: pinmux@40 {
 			};
 
 			omap4_padconf_global: omap4_padconf_global@5a0 {
-				compatible = "syscon",
+				compatible = "ti,omap4-sysc-padconf-global", "syscon",
 					     "simple-bus";
 				reg = <0x5a0 0x170>;
 				#address-cells = <1>;
diff --git a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
index 915870eb5c99..3350128db22d 100644
--- a/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap5-l4.dtsi
@@ -96,8 +96,7 @@ omap5_pmx_core: pinmux@40 {
 				};
 
 				omap5_padconf_global: omap5_padconf_global@5a0 {
-					compatible = "syscon",
-						     "simple-bus";
+					compatible = "ti,omap5-scm-conf", "syscon", "simple-bus";
 					reg = <0x5a0 0xec>;
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -2311,7 +2310,8 @@ omap5_scm_wkup_pad_conf: omap5_scm_wkup_pad_conf@da0 {
 				ranges = <0 0 0x60>;
 
 				scm_wkup_pad_conf: scm_conf@0 {
-					compatible = "syscon", "simple-bus";
+					compatible = "ti,omap5-scm-wkup-conf",
+						     "syscon", "simple-bus";
 					reg = <0x0 0x60>;
 					#address-cells = <1>;
 					#size-cells = <1>;

-- 
2.53.0


