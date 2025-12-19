Return-Path: <linux-renesas-soc+bounces-25917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A68CCFA04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 12:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 789813062BEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D4831AAA9;
	Fri, 19 Dec 2025 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RzTHsM0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0J1nVhD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA4131A805
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 11:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144568; cv=none; b=t+sRrPMNNv3e8nry1xb2BBan4fQZZM+8LQ3H7cN65g3AdgMK91R8H10V4qojeeGZTy3Z+lEcv3pIMMPob3qWusnUvExWpA6ZFPti7mUmLdqvJ/pJJrLSa/Cmukv0znFgxjrxtS6JGPbVl/LQFtE4A9xr6pfS6gpBFo7lvFKzd+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144568; c=relaxed/simple;
	bh=UaHO7/eOvI9UQifWvLpwmCqdh2eotyE0wYd3BHrZ6yo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X6BYYmn9dkMZFSWd/ArIB18B1MPZua5OMcOzKWh4YTfdfdbEqxQgR3g3e1Clp+u6tBzm3sqaUmwJcIY48G+XaZ+Idn0Npd1rcYBCbZETw67XDNeHtbZ7r+F/3kegjCRqBrqZYECdIZRjZJxa8MdX/3PouTYFWUI44wt0Q6p/OuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RzTHsM0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0J1nVhD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJB9EKO1772385
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 11:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pWp06pWmbjSJvf7fIHkRuG
	NgN8f0S0siEmA5b1mlZsk=; b=RzTHsM0X2eAVgNkpqzV4KcHaBNbRa8NsXlPAxt
	42E1B9C8t4UZ7DRJQSLJNmBT5HoZanJhTGHOxwQKdKRMzjO7VmRpjYny/gJm4cHA
	c/AKbn+yDDxMez/LuoP93x4n/kWRXNYw+w1PiQ0+X1HFdesFVQE2Wd5EQleXpOFi
	P83ccJH61gP+B9P8A93PaamGzq9B+v6Oe7VGpyWSMt9ao2wgvUb17b6whR9repqz
	YeF3uEKa1nOJuHRgSyLVO9IAFAb8fI5BbH0PJuY35JZufcCGQ6O/9N/IXR5huMcc
	PotSODojz7ryMlBtHRIcEZeP3WTb766UV6I2+1UisFqKPLLQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2bjgys-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 11:42:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed7591799eso36416881cf.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766144564; x=1766749364; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
        b=G0J1nVhD1y9wMNYtcmuJ7qB1lA/yvR71m+J4YO/+fqIirxPMiXL78pCEX/FWuVvS6o
         T2SU9gr7HhgorakXkTPpnBEzeeHD24XKx3pEfdG80Ol8ZwFB4TVChfFUQwEIP0b7yc37
         MHRyZBf9JEJ0NsnWvpU6AQ50lsyAMBP0cZhcQFkp9MzNygSMa0zorjvjfyxpCrcEX9I7
         skhHITM1z2iq2ZgAYAOPVQRmEDNNQXFgjFrW7IUDBb5BPFXNBRliV4O+HYiFMlbEy4cV
         b18oSBTZHx90FutqfWVHE4TUaPypjqY42AA4QbvIQ97sgk24MeJOm7uu7gzZJjqLgl94
         rBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766144564; x=1766749364;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWp06pWmbjSJvf7fIHkRuGNgN8f0S0siEmA5b1mlZsk=;
        b=pTglyJS22ES8lBLxOJv56T678YPu5eg8D4ExJ3AXlM9w6wmlAHgJil90LoQnk5S4ic
         cI8QxgWh3F7N+mAEFoUqcCUocyQfgMBFN1FGoRcxunZgaaE9CvT5gqZoX7S0lK38yyM2
         OL3EqPOhGi0UkZ+p0/1lL6k+4E4AWcqXMhEtusTfDrQczgzT4hT5qki6OSHCDaQSLlze
         UdBrtThCoRfEHiUAqYCPysE0Lz/0MXLvauEtyCghQquSzGFTNW+D3N+RyhB68oekPDtB
         WeLxjAxdKSoXEHlLHb9HB2iLW/BE4uxJpeh983z7hh5MGFYqLzZZVaCn6yIFk+6fQEo0
         Y/UA==
X-Forwarded-Encrypted: i=1; AJvYcCWXwXz82lft0uDn/qPnwYLkhiNbPzzEfndbLdRUSUI3OY4zYHYdq0Za49Npj67gZyiIMulgTAJuoeBC3Oopqk8OXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCVpVhPMOeOfSv4nC6lgcF0RSONhoBKy+FFaIZOzPRPyxdJMyk
	Sdvb4Jn32HuXTGIXGrLh3QD6CfoOzfSvJkOH6xyx+Bz4oEonZ5C95BVMhsTm6iSQ+6q9kycvDXX
	Gqcz4nejgvEwj3lgpgdXSexDz5M2RwN/JNpmJ+Rdvgv6wLhB1AosrkwhfGiGB83F2diCPfl/VuA
	==
X-Gm-Gg: AY/fxX44qYTGyhvIqPNrT+ri1oY9EnDSyP0CBms075/3MOkVbUg2v9KJkaXhQvs3ns5
	YamoZn86jhZOdEM45T37MMU4UfjgUeCGPz9H8EkMZ/FRzOHLz5bLzO55K3FwJVYAhpWtFTKI/7L
	WR1cuWe+vm72NBzi6brvsg2bv+sUR+jMCvFj2BwT4uuUCVPpQgAofe3u1Xc4bG+ibYEz/fKedcL
	3jSF9FNvPUjD7Qa41Fwko9XQ0pMGn6ApTZUFAneJrHKB9XxnGIFCv0u04PzXxUWIwE1VPt430bP
	5uYpMHKGqskA7oXLgdAFmovNmVVy2oTNm7DVUXFdPUwgyfeUUVxqUvway0LvZF9m3dzW8NaJTtS
	ua8RPfFLWn3edQvCN5I3AkxOTQzKW11lTSQwho8I=
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id d75a77b69052e-4f4abcf6df2mr32638481cf.1.1766144564324;
        Fri, 19 Dec 2025 03:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmBbFYUgOlr6WN956Einac/qKi2Xml3/A2v+AE7uUKmhMDZRt/gScziSp2QVRxwtyeDwUkJA==
X-Received: by 2002:a05:622a:250c:b0:4ee:24b8:2275 with SMTP id d75a77b69052e-4f4abcf6df2mr32637891cf.1.1766144563807;
        Fri, 19 Dec 2025 03:42:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d857:5c4e:6d25:707c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm41134425e9.12.2025.12.19.03.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:42:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
Date: Fri, 19 Dec 2025 12:42:15 +0100
Message-Id: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABc6RWkC/23PywoCMQwF0F+Rrq2k7fQxrvwPcRFrRgs61VaKI
 vPvVgUfOMsbyEnujWVKgTKbT24sUQk5xL4GM50wv8N+SzxsamYSpAYLDT/5eOAZndT6yOmAnrv
 GgFQavRaS1b1joi5cnuZyVfMu5HNM1+eJIh7Tl9YKGNGK4MCVRNv6TpAxbrEPPaY4i2nLHlxRb
 0KAtGOEqoTV1th1KxXg+o9oPoQY7VSaSnTWGAPgrCf8I/Q3MfqFrgSIjSKF2Cn3W2QYhjugyuI
 afAEAAA==
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4401;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UaHO7/eOvI9UQifWvLpwmCqdh2eotyE0wYd3BHrZ6yo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRTokWXsa2gKI4nKr8h3MYxFUimxm2O4dHtXW6
 KCiHQiv+CiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUU6JAAKCRAFnS7L/zaE
 w5TBD/0VsHh57NK5nQksuR+8VSL79RDSjE5N4Uss3l4JwiFExzXFJZFpCwifvwH9coSoqlwSmi/
 HJxLjwprjYGZnaU+rNXkOiZ0EsDovcObvNYahOJjd6Lo56NFM5cKuvxZIPtBE+iyaBwmzxnLmu/
 T2hRwgo12C7kTrrBKQUhlfxq8n1b/ffXt8j3ZcPGUYWSirWStJVUES0McEPRujOtu1OkWm1SPmV
 Ejrd9L49HQ+nO6ayV3/BwwVVypRf+179KBzXtsYmh2ARvDwjC12TUaLQ1v4RX9OXsYdoYgch/S6
 yvKvCxXExRkXnvfNQShDqpwxsqQH+ugBqbTLmnyBt4Yr9mDyozKPTqaktQISbSrpK229wF+8Wqv
 8y4/UN1sWaRnu0hyRREDiaMQRMu9WPHyGDpBBS8WNsUk7q//HXhhNZhgg3nn9uvVNiEqwD0mE/F
 awDlTEUaCzTLaExwn/CKC+RL+ri68hNQj1CiAfnruILFOSDcjcS6x2jWeVHJ2DjVby4z6+Gf2vV
 oduw+zcDEJ1Xe9k2AEYXRVqWBwYmIbh2NxHM9AaMWrxwouwIUENXthjhKxJB9V+Z08rtzMIYqnf
 jYCydlPUBZgHMvymTXbhPio9aTl7NoQa5wAPhUk2jOJbwWYIDgFqegzo+VSItUKDNtUvi8/qrdR
 +XbsmEDfNuXywwQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4IFau_89XhH-dBwwgUoHYll-QhC38pR_
X-Proofpoint-ORIG-GUID: 4IFau_89XhH-dBwwgUoHYll-QhC38pR_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NiBTYWx0ZWRfX/CmKP0yQo0Ri
 BG2u0DGrAIGKZHvMSSZVlX4xrTMuqgxADNmJBMXzPMl1PBSyUXIvwJD8VMFtvjiHU3V/PIbSSJw
 FKLp3j1rLpzBkeB5UlD9N6OGYzNg7/1v3Dr76c9C5AgpFkPDiSpJymmufTvtpNoM+eFMtz/hrM9
 P6Sdqu0lgGAPsGp55Sd9QiBuiHdCbl6rcLuXBVQmOM4tgF+ua8Kw8tPu1q4qaIttJiDoa38bh2J
 Y81/hzdwZQgJg2PjzZ1TiPPomUKBRUb4BLVZXmtP+PeDiDpYTlXN8LiyRCMTbesNKroRB4M+eLI
 2g1HSBJ70TXEyRj6jcpnRN3C7JUnYA7z2Rj4+65EeuhHtDDZQB03w4qH61Yo7GmyK7rdnQfeK0Q
 ESfGt166kRDYG4T62Ow0AInm5qvOAqpfLNn5WM7Bs/mB+DhjOZubA8/Cya5+uYxzEQ2Gc2meIBa
 EkJJHFTuRItbf2etxSQ==
X-Authority-Analysis: v=2.4 cv=WYwBqkhX c=1 sm=1 tr=0 ts=69453a35 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=PHq6YzTAAAAA:8
 a=h7uu4O38hj_b6GN6T5YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190096

Add support for the firmware-managed variant of the DesignWare MAC on
the sa8255p platform. This series contains new DT bindings and driver
changes required to support the MAC in the STMMAC driver.

It also reorganizes the ethqos code quite a bit to make the introduction
of power domains into the driver a bit easier on the eye.

The DTS changes will go in separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v6:
- Fix $id value in the bindings
- Drop patch 3/8 from the series
- Update init/exit callback signatures
- Link to v5: https://lore.kernel.org/r/20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org

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
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 344 +++++++++++++++++----
 26 files changed, 454 insertions(+), 59 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250704-qcom-sa8255p-emac-8460235ac512

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


