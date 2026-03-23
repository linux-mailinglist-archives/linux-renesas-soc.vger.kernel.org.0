Return-Path: <linux-renesas-soc+bounces-30108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NqYLG1AwWmeRwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBE2F2F0A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B66430C6306
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A133AE1AA;
	Mon, 23 Mar 2026 13:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7T6It8n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ckdh+jxc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AB33AD52E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272099; cv=none; b=Oog3hgAM49dvAk0aveXCASJSDllIqnefDvAzyQJlhHe9EncGJK7vtJvKnBfRIj8dsvVIiPtRn3LWKVG05uLYCv3XU8vCV3sMb0MVZSiubixVwHwmfT41+RxJ6KM8yAIUn7hkBxXvifofg0xs8VMqvcZH/eib7/HKiR86RQfts4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272099; c=relaxed/simple;
	bh=cUDrs1O/XO11AhOC23rnXsi1wxL7UD1u0mwnarp3gg8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHoZ7ghNKwQ2m+ucJPb3MUD4nfUEIQxjprI9oFTIO7VDgTR2BNvEXn66Bx6ztAbRnIamhg/xOkcxz1wphxidS30OzkzkfIllHRAy2ATJjoGFGMWHKU3q7PcwwBGY9qcVCgcUaRcrSWBfhT1r88/s0TXZrsg5aZDPzhJVs0GQVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7T6It8n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ckdh+jxc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCefG92475964
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=; b=N7T6It8nbsDjVway
	9BaZbbouLTiam7yJxUITofAZlsTOVZ9Uonfn7oqHXjXD70WrIyNaCPW1Rtph2gir
	o96a5zTDERM23kBtl0XofxJBEr/VQ54r6TS+MzShIQmAfX/OeJj7GXjqMEK3Sh0M
	nkiHvPDXvFyPyysqKWmIGbDpPfRRC/VeyUvxf86mcKZ1aziJSXdOmlazQNQZdmLD
	IHkSHwRwB25W6q/iLKlgpEUsuaMSW6fQELS1dZ0iB8f9Ni2BdEIgZY+iVdq9BDBi
	5a5lDTrA3wOQfaFe/e59Hnptt9CqeoNVspDsgl++i1ZDj+R95UkgxCpu5FLjZSjB
	SM/ZcA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2046s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:36 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fff2d5756fso2457051137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 06:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272096; x=1774876896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=Ckdh+jxcyvgtt9jSSmLZbnu9f42PTFMPsxTEftqMgEZ7Kj2qsgMkEa2spzwg5sGq2I
         togbtxr+QSuFJ+YHTXPoFeNQ0fiGJMjwixZLn1gKPvFQqloKeBozznGTpmXrXj4O8KPN
         doXbE5m0Gzqs9qEw2q/gZK0WMXOe3g30qfMjPdOhJwNP50AlPXE1l1eL5IXuK/MhcjZ3
         d9FEzB3x4MQYXH6PERyZXKHhRvxDilsvav5j773TWrigLmQqF8aIWru8YkoZM0mEoIED
         DsqApxa0z2XSPtaj9uq44Nl2Enz88TWN0UFUYbvZEbuDXetaIxRWSB+XLttkgRRY+KSu
         Khhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272096; x=1774876896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JRiiX4zWYpuwYrXgVU9TJdiqt0ihuqsNqrMiVyK6xfI=;
        b=iDVHWEW1Rc0r0lK9Dn8GvHkxOqpL1OxXgoC3EJsrKzDP+DQ6QWhDwreW0WKBzXF1MV
         FOfolb2acRwU+o0/+SZlY6cuGchzHspJ/0BCoDIO1MgqkisKAVMKMoYk4ONzVIO7UEOW
         bsx1SiaWUa4ZJjuYYr8A2sI0M9HCypbdf7h2fmxYnqwtVrRcVMxN5296WtfLpYIL71F1
         AgM5CzW3wxfwyab2Eb+XMCBzu5j3bQdV8DNxbof1kZ3TO6m2yXQD5kKUmxsY0mTCf2JZ
         vFIEXFhR03pdVct2vvnQbdwjwo0ke782sebgFj4JITeCYr1h4cB/0H1scJtwFeB57rJp
         MJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUchJ3wweyzUKicqakaZWghs6FwdhdPcrQ82PnXqIzLVMcn11zerY/keNBnENcz2uSTj6HEW0GKBL6RUP3ychE7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqVFgrVFmk6w0O/0Jfj1qKQTjBc4HcPjRwsRLeVXH5xWnu0yrp
	+xcAn2XK/e44UEHvPuvmOy34kP7NXpY3oNG0WP6EtIdy7/Q2DrNhTtO7u/wFxx0XcP9hMVln+fB
	AERGCqvgu8Ldg63hxENmgDqqWDZMZhfon5lN6LYf4CGxribNS5fzUPYMwR6Ok5LRe9S9G7kI1IQ
	==
X-Gm-Gg: ATEYQzwE9YJ4CAL9fHUnpGQ5v2UxoyI4AcWHtkW160SfESiRF/ktfiMUDsMFjr3nvDW
	tI9ZWmSmhLzdaqEgCeKbd7a6gDA+xF817CjD3uMDg1uBFgMi+TgU1i1C/loSTFfyS256+SAkjih
	kdzEhRLcTYx207SNl2R8PuPTn80CrEK+RrUt+tCaosuJSIhaGuZ7YdXH2g5YiGn8oHgVvy34r/q
	v815Zl62fJ5cG69hB4neu/tE4x+fRMlFGsv+Q46LWDA17VsC0oqZDBQpweIMf4cgyM8MV17yGVn
	2HQYS7ZpDHjj0rb/UaFPB0bvUVQrkiA6srHb9qzg1xaA3eqCyZwpZueELKoT9rXx/ak+T13Ss5v
	ySwI1jejjB6oRVnd20xkGlVCL5BPrsh2AUmSIrWMJ58WtYGMEwgPs
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875613137.14.1774272095985;
        Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
X-Received: by 2002:a05:6102:54a0:b0:602:8894:b779 with SMTP id ada2fe7eead31-602aeb097e7mr4875596137.14.1774272095387;
        Mon, 23 Mar 2026 06:21:35 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:34 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:57 +0100
Subject: [PATCH net-next v10 5/6] net: stmmac: qcom-ethqos: split power
 management context into a separate struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-5-79302b238a16@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4863;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FNVr79Fi6sLZ+qldLv+chKiF5qjCh0lSqoNC0bsdcWI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5Kco3rCH1VoOXFDR6Bta8LK7OVpeQox5VMf
 wZ4Jyd66j6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+SgAKCRAFnS7L/zaE
 w6WiD/43aaKifrVrtm996QHxWlyMyw5s93jMLKJudGiTSczX3O/TIKMXj794jsC0Pc4OBGPTqss
 Z0mROAxzMuBD37BojXp/vcgcGqNZg0C3TnWxCKWAD0K2SDDd9447LEJHMLcaGzGwfGnKplt0qbm
 rCu3cocM6WNQgCmHWphIBCmzdOCMkZ5pct7oC6hZab0GVwMyhgyhsySKKWvWYFbygWpbGAMZSDQ
 ThxdhrIA7NdGkT7ThmW42HafLfeF6UXMDVRtggBL0D1cvBx1ClnCmo1lxH1ADl+Xp0Fk+7SAnj8
 lwjEkCvhzKK7jkAqCH0KgccSCsJqZahhtsC0eF0iKElRDXmmKGwo6tur0en5yINcOaY4I3kv+Uk
 fjtiuJIeE6m0P/6OvTXroZK8880eODd8OGjhaHBGSIm/yyS4jzb8OyP0xNsOU+htF0R7OZlgDM1
 4b7y6O6RTgnyj078Siyr9DcyI5f34Lx7/MRkdKMbkGtMOr6JYo2fshp2DloitMISvkm/nQDfqSe
 auEeVmwORvOUbUdefPJR2mDibC+whHC9nxZT6cTrz/1eqhdFP5xKjPFBO9wKGaPbNOZmUXWIxno
 Re35XT5k6K2sPqmE1pKF4aO0C4casqDsVItnRxIp+UMKfESDbaj4Orb16Zc6J1TATb0CUihwqAG
 AWkCcpWGVud+Wcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13e60 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=TTAMOEIJuQy2Ho-tp7YA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PcRDz5sRoKKyw0bKw9GQGdP3tPlxDCMM
X-Proofpoint-ORIG-GUID: PcRDz5sRoKKyw0bKw9GQGdP3tPlxDCMM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfX3zyovlCeps64
 EsM8w/lIed9tfO67Xxia7yfUbzXkSZbUX8kXBinZqhhFCDzjrhy9gvlZqSjwxBF+xbRb3Ufrtzh
 949Tnv5eInWw+fDYVHLhf7ZuJkztmh3dyI8S1Y0kSDcc+m7PH2YmEKJ66khawr8TIogQFg1R0VB
 vKEzTxsizRTBnr9mPrFdMNN8mvadnyOxf5AjS5iEZWMGJB5TVmCSKLUuVjbuKTifPOc8WpoyCCE
 gI/VerCrUwQuXt6jyqg90eVRJ8LWfBsmxwZNFMghWE2EOhs6+WcpV1Vps5OvW8rZmcefVocfhJw
 WjM2C0S292LX8SoKie8l2dbLdywi1/k1fOUDUQCO790KRaB3FVJ91B4o+kfTqzbY/E9NlsSNxO7
 qzH8SSSHUuykcD3gzcYep6Fw7pflM7alXxEx1F/TmEujtnQeZgbZTFa+iWp0h2tgEP4WRi4bpRC
 Y+jOlJnR5ereCJ8T0rg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230103
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30108-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0DDBE2F2F0A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With match data split into general and power-management sections, let's
now do the same with runtime device data.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 40 ++++++++++++----------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cbfae18773c1193cd640f07824f5a66d68f9634b..f32ff0d9ce513d8270c8db9c549a79778549df59 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -105,14 +105,18 @@ struct ethqos_emac_match_data {
 	const struct ethqos_emac_pm_data *pm_data;
 };
 
+struct ethqos_emac_pm_ctx {
+	struct clk *link_clk;
+	struct phy *serdes_phy;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct clk *link_clk;
-	struct phy *serdes_phy;
+	struct ethqos_emac_pm_ctx pm;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -194,7 +198,7 @@ static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
 	if (rate < 0)
 		return rate;
 
-	return clk_set_rate(ethqos->link_clk, rate * 2);
+	return clk_set_rate(ethqos->pm.link_clk, rate * 2);
 }
 
 static void
@@ -670,13 +674,13 @@ static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
 	struct qcom_ethqos *ethqos = priv;
 	int ret;
 
-	ret = phy_init(ethqos->serdes_phy);
+	ret = phy_init(ethqos->pm.serdes_phy);
 	if (ret)
 		return ret;
 
-	ret = phy_power_on(ethqos->serdes_phy);
+	ret = phy_power_on(ethqos->pm.serdes_phy);
 	if (ret)
-		phy_exit(ethqos->serdes_phy);
+		phy_exit(ethqos->pm.serdes_phy);
 
 	return ret;
 }
@@ -685,8 +689,8 @@ static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
 
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
+	phy_power_off(ethqos->pm.serdes_phy);
+	phy_exit(ethqos->pm.serdes_phy);
 }
 
 static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
@@ -700,7 +704,7 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 
 	if (interface == PHY_INTERFACE_MODE_SGMII ||
 	    interface == PHY_INTERFACE_MODE_2500BASEX)
-		ret = phy_set_mode_ext(ethqos->serdes_phy, PHY_MODE_ETHERNET,
+		ret = phy_set_mode_ext(ethqos->pm.serdes_phy, PHY_MODE_ETHERNET,
 				       interface);
 
 	return ret;
@@ -712,7 +716,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 	int ret = 0;
 
 	if (enabled) {
-		ret = clk_prepare_enable(ethqos->link_clk);
+		ret = clk_prepare_enable(ethqos->pm.link_clk);
 		if (ret) {
 			dev_err(&ethqos->pdev->dev, "link_clk enable failed\n");
 			return ret;
@@ -726,7 +730,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
 		qcom_ethqos_set_sgmii_loopback(ethqos, true);
 		ethqos_set_func_clk_en(ethqos);
 	} else {
-		clk_disable_unprepare(ethqos->link_clk);
+		clk_disable_unprepare(ethqos->pm.link_clk);
 	}
 
 	return ret;
@@ -819,9 +823,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+	if (IS_ERR(ethqos->pm.link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
 				     "Failed to get link_clk\n");
 
 	ret = ethqos_clks_config(ethqos, true);
@@ -832,9 +836,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(ethqos->pm.serdes_phy))
+		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
 				     "Failed to get serdes phy\n");
 
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
@@ -859,7 +863,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (drv_data->dma_addr_width)
 		plat_dat->host_dma_width = drv_data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
+	if (ethqos->pm.serdes_phy) {
 		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
 		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
 	}

-- 
2.47.3


