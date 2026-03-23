Return-Path: <linux-renesas-soc+bounces-30109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGDwJHxAwWlnRwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 427222F2F28
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9D57307F392
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F0D3AE6ED;
	Mon, 23 Mar 2026 13:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCo3bctD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6u2DHli"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6E3AE6F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272103; cv=none; b=AXOVhB9ZhN1PJlA7sDB5mJC87kOoCjlfdJc5t28JWESRjrA7lae9n6G+1e9cs1SMAIFD9LqmRDOXyLDx86vihIpRsLGOkntdbTXf6WI9VU4lAoUb31kDYVzVr2SQoRY2SFEl2VkMDDHkLWoJbJ11QjN3rUlsAGB7a4Qefw8EL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272103; c=relaxed/simple;
	bh=3YX99yDiykq8wht5jhlxLD9GqcQlDRrqtioZ2YaSMF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZo5ovnk2INz1q7Nsu6PiLq/KrVRmHjih2KUA5O+XrKxSTMHRFlYY72dAuncJrcyNnyDnPozlk+ym9J4y94e20/R6yxgs0HoumA+54qo7UplNp2nLLpbfnYGpQPl5JvZ/y+90sIghKN/P4OpRZNR2j/8VhLT85rEi5XIrw4ZiAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCo3bctD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6u2DHli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCegDE2475974
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=; b=iCo3bctD9dFdamfa
	Bge8/bpjrUtGHfrLjSKxlAKdSdgLfeTPRB2955lSkQ9bnimI+QXHSVgYGnyRHPwR
	FJn4MEz7HfIfsEAAOfV0G0pzSv+RoCxtebxCjqtZlLhI+w8LlCzhbwojwfxIKxaf
	BKXzTJ5sH/B+xtIGMXM+aZnbRo9kKUiMMNKCF4YC7QFIIG4C6vRmYhAzlCaL/5PX
	3FYg4/rd6DpQg8nM4OhfyGZ4YJEPKIb0kSbze5Wzt5hwvfolVH7zJS8b1NeMUA1+
	zcTPC6lok9vzDSOrF+Pac84oafnPqKgM5zebVowQUWqeqdA3cDsB8VZgcq9EmsW0
	r+7lig==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r20475-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 13:21:39 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94d6c5433a0so564611241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Mar 2026 06:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774272099; x=1774876899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=;
        b=Q6u2DHlidG5C6+SHelVXxlMQYVBoUM6xKJSOQYnchxMVD4f7MFvcdVjoDoWy5205hn
         TQrcJhu5KA8SSthNDZP1IAPb9dn3pKCcDAC3GGJd/QHC2ydvGQJdqrcQ7lWEwQN6NK3l
         nng37S+os+4DFSf3kxB1Fsn+ETNSWprSjr7z9qNp6xJMS2IROUKxzSzMKkt341dAy1T4
         XgyCuFXdwQ8QUe4I2rG4b3z/k1Zhy+1LebY+PvvT9gizQX+KUDYYr0GC4qDydFkph6Pj
         UnGv4RdPd7Dc+r2UZsEIs4muWLhwBV1e7sb8aCw93lWeRZrGgYzzNNa8fJkq7Ho2RR2J
         XSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774272099; x=1774876899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Q2i+GiHSpXUMk/5V2t9vb8q95gvl7L2wScFZUzHsU8=;
        b=QuQpFZKX9H+/ROWKYcOqh8ZD/Hbuovbs79lqtXeGm2OraFHaI9LXi5i8RtWyn8PbAU
         HXixjDV9MXdmBZTKufLl8jZYv0Ea2+m+uefwaaQljMbXIdW2GzmXvaa/Yp+6jAs3cgCl
         lus70izKWHYDjHO8eoNy15ZMZvVIJP5tgmhKTdaOVM6o2vcT4HBVPFNuTXc+2inbvkN5
         EyIsQBa95TpwLPA7Oj7J1QbOqBHBYLEcP6FORd8N/3nZXlb4S05HjuVwtZbcLyhhptJw
         wYSmmkrHGbj0Baqy/ZBgr0V59U3FacxWxrw1mDjS5gWjz5NU44/REtQZdlxKY7HeJEh2
         UjLg==
X-Forwarded-Encrypted: i=1; AJvYcCXIg4fk51O4nsW65VUZGnViDC6eqIsxfJfpKtg0QSZsUQZYrns6Z0jyo8kF7T+vxrkInRoMx0jkCJkDJbayOJjOPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCzQt+rm9m0qx1prBlvbgI6doSUETkf54GDVG2jqp/H1fPJNXU
	EjDMEx2P8meLadLv1u44J6SA6Hk21JbJeaYcZdYo7YogOmMv+szzcPXMxhprPM4B+MCoikdH80H
	Mij89TZ3HjqsSIE7ggeg4WaCxZ+45yIPv0BddlWRD/rr9ynFcP8KQHjeKRAoRF1v8ja6seS897Q
	==
X-Gm-Gg: ATEYQzz1Mj3C8Gu2YswFmj/6oYaguXthyK2sV8dM11ChH6++ZZGgkXJiOnM2gJCvfUL
	VZKYrrfLoYMBBw4AMlxQH9hxS+7+sdQoaJIerTRsfLkJZNXGwUzSIySnbT3AXbIDIFs0FsrbJIN
	GdOKyBIhpPyOPwbvaIxKx51LLTHHjYbnkQmAMs8wNoVb35Yw6gU/WjkQnr/nwReDMEXGsYGcVXd
	LS9MCATJYioLQkDzev3vYrqLrnlvInoRMz6W/zsdasqJ2G/PJSbAkncwobJYLf+/zzNVS2vxK0w
	IopgoRysKxyF2LubWNg5Wnd/e+3N2M8VDS4KY4LuFLBXxpheJKSzT84cWaYxDJMama7YqvU5WRY
	9tl3jXsa60pXmAMYEkbYI5BjyPQQ+f1JU7hAjLCebHqNMtHBMwosB
X-Received: by 2002:a67:e704:0:b0:600:106f:5fa8 with SMTP id ada2fe7eead31-602aeb230cemr7011673137.15.1774272099018;
        Mon, 23 Mar 2026 06:21:39 -0700 (PDT)
X-Received: by 2002:a67:e704:0:b0:600:106f:5fa8 with SMTP id ada2fe7eead31-602aeb230cemr7011634137.15.1774272098415;
        Mon, 23 Mar 2026 06:21:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f44034sm503102066b.4.2026.03.23.06.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 06:21:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 14:20:58 +0100
Subject: [PATCH net-next v10 6/6] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-sa8255p-emac-v10-6-79302b238a16@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3YX99yDiykq8wht5jhlxLD9GqcQlDRrqtioZ2YaSMF4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwT5MxDQjK24eHHLbfxTlhthlxk1AlnbkT6xW2
 Px45/VChQGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacE+TAAKCRAFnS7L/zaE
 w3tuD/9AKs1Rakst0JFymj2NL4Fiz6GIj8cqw+hF4MSyRmFOucfl69YYPzWKzTdq+uAAr22YdEL
 9Abr+BvAHm7D4iaFnrAiF6BTSfk1cEHBDhCAteqv2UScshQmx31ufaniixWpFHwWpHQITdwXQ6t
 dlkgwBou2xzYVYWyOJCny7Agc+D3FRqKbA2f2oZGHintY7wC+8plmU7XRMDZEeIfCR0ybFgb+lj
 juYAV+zVqj0d9eiPXFeon/v+X8/9/ImSus+dCfSEpXNOl9Zpk2BSPzxUz7NEpRWrNQzWrPK8nDL
 pxHIzMf4IX+PfWgVK5rrtIqgIrJ8nU5dhFKBT94SrlFzqfYge/RLtVORkk5hxrBKolsbWi9uvEX
 hVnfJxCLudFoqypbDfiWv8wZipltIgzR54ulv8Ao/fdrpCoUSwCPFT5WCD4QyJpoi4OKASF8kBR
 39raOzFLCB1QsOSbgeVmSETi1JOcL0pGbYTrsnRGsWEgytYa94bA0T6etRRLOYTCr3Zc+/j7foT
 VkoHlOxy5xHcaImeUGB1hmVi6lXrUflu4xLy0cmmEzECf3RHlPzVTKiBHYD795XOdO1X5Lyb8aL
 js8veq1ZHAS1dMHyx6vs4KcffdZGwair4wXZ3TuX6/cLZxa6sMV8JppglLjuT39qAdE0QL/jylY
 Hs2CWaKgBuO+0jQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13e63 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=eSQ9y_BssGCL3sbXkzsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ERt4rSmuphpWGXxCw8gYSAasGGPNzel5
X-Proofpoint-ORIG-GUID: ERt4rSmuphpWGXxCw8gYSAasGGPNzel5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMyBTYWx0ZWRfXxGgoKlKHlWLh
 wAB8XcI+hAHg9+2JnBgIC6kdh1oCRud+FP/ZAC+q+rRoMpt+ErLPVIV7hF5CqyQZKrvhKtuABen
 R8N7cra9sIwcvJGReqPQ5Q8s3CILCHHzCo7reuoAYhm8i5L7aoDirp7KdbpT/dGXv/eL1GmuQT6
 muzDFmMUVaTIcrNcCoK+raRM7O+Q5ogw5Fuzl3WIniy8ek922EP+ayVOf3jVGgCiwPDcUQoLofM
 QbAOSt9g4s4L5ZuAl4AaSaYQEpN1yPzfq36gUBhfB6a6CWc9FDIXWfSXE0uXcuHzbUmhB37JYCp
 4pr82H+w2gyyKLlqpDdqVtHy6yefwEQwreeVPdbbyrdzHSefnXlf+c6hscV60yuIFI+k4GN2Dnt
 Eg4c1iW98H/fKCj0XEJJNSPXEub4r0HOPW4BCAgIJ0MkooCzGCCWyGAWvIEjMkWeHZaD53fL6P9
 ahfDk0PCRzTMD71iIxA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30109-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 427222F2F28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extend the driver to support a new model - sa8255p. Unlike the
previously supported variants, this one's power management is done in
the firmware using SCMI. This is modeled in linux using power domains so
add support for them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 301 ++++++++++++++++++---
 1 file changed, 262 insertions(+), 39 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f32ff0d9ce513d8270c8db9c549a79778549df59..09ce80b446cbac8bf85d974a3d6517e037b049c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -7,6 +7,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
+#include <linux/pm_opp.h>
+#include <linux/pm_domain.h>
 
 #include "stmmac.h"
 #include "stmmac_platform.h"
@@ -81,6 +83,13 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+enum ethqos_pd_selector {
+	ETHQOS_PD_CORE = 0,
+	ETHQOS_PD_MDIO,
+	ETHQOS_PD_SERDES,
+	ETHQOS_NUM_PDS,
+};
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -98,6 +107,9 @@ struct ethqos_emac_driver_data {
 
 struct ethqos_emac_pm_data {
 	const char *link_clk_name;
+	bool use_domains;
+	struct dev_pm_domain_attach_data pd;
+	unsigned int clk_ptp_rate;
 };
 
 struct ethqos_emac_match_data {
@@ -110,13 +122,21 @@ struct ethqos_emac_pm_ctx {
 	struct phy *serdes_phy;
 };
 
+struct ethqos_emac_pd_ctx {
+	struct dev_pm_domain_list *pd_list;
+	int serdes_level;
+};
+
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
 	void (*configure_func)(struct qcom_ethqos *ethqos,
 			       phy_interface_t interface, int speed);
 
-	struct ethqos_emac_pm_ctx pm;
+	union {
+		struct ethqos_emac_pm_ctx pm;
+		struct ethqos_emac_pd_ctx pd;
+	};
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *rgmii_por;
@@ -338,6 +358,25 @@ static const struct ethqos_emac_match_data emac_sa8775p_data = {
 	.pm_data = &emac_sa8775p_pm_data,
 };
 
+static const char * const emac_sa8255p_pd_names[] = {
+	"core", "mdio", "serdes"
+};
+
+static const struct ethqos_emac_pm_data emac_sa8255p_pm_data = {
+	.pd = {
+		.pd_flags = PD_FLAG_NO_DEV_LINK,
+		.pd_names = emac_sa8255p_pd_names,
+		.num_pd_names = ETHQOS_NUM_PDS,
+	},
+	.use_domains = true,
+	.clk_ptp_rate = 230400000,
+};
+
+static const struct ethqos_emac_match_data emac_sa8255p_data = {
+	.drv_data = &emac_v4_0_0_data,
+	.pm_data = &emac_sa8255p_pm_data,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -406,6 +445,28 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static int qcom_ethqos_domain_on(struct qcom_ethqos *ethqos,
+				 enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_err(&ethqos->pdev->dev,
+			"Failed to enable the power domain for %s\n",
+			dev_name(dev));
+	return ret;
+}
+
+static void qcom_ethqos_domain_off(struct qcom_ethqos *ethqos,
+				   enum ethqos_pd_selector sel)
+{
+	struct device *dev = ethqos->pd.pd_list->pd_devs[sel];
+
+	pm_runtime_put_sync(dev);
+}
+
 static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -655,6 +716,20 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
 	ethqos_pcs_set_inband(priv, interface == PHY_INTERFACE_MODE_SGMII);
 }
 
+static void ethqos_configure_sgmii_pd(struct qcom_ethqos *ethqos,
+				      phy_interface_t interface, int speed)
+{
+	switch (speed) {
+	case SPEED_2500:
+	case SPEED_1000:
+	case SPEED_100:
+	case SPEED_10:
+		ethqos->pd.serdes_level = speed;
+	}
+
+	ethqos_configure_sgmii(ethqos, interface, speed);
+}
+
 static void ethqos_configure(struct qcom_ethqos *ethqos,
 			     phy_interface_t interface, int speed)
 {
@@ -710,6 +785,45 @@ static int ethqos_mac_finish_serdes(struct net_device *ndev, void *priv,
 	return ret;
 }
 
+static int ethqos_mac_finish_serdes_pd(struct net_device *ndev, void *priv,
+				       unsigned int mode,
+				       phy_interface_t interface)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret = 0;
+
+	qcom_ethqos_set_sgmii_loopback(ethqos, false);
+
+	if (interface == PHY_INTERFACE_MODE_SGMII ||
+	    interface == PHY_INTERFACE_MODE_2500BASEX)
+		ret = dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_serdes_powerup(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+	int ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+	if (ret < 0)
+		return ret;
+
+	return dev_pm_opp_set_level(dev, ethqos->pd.serdes_level);
+}
+
+static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	struct device *dev = ethqos->pd.pd_list->pd_devs[ETHQOS_PD_SERDES];
+
+	dev_pm_opp_set_level(dev, 0);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -741,6 +855,68 @@ static void ethqos_clks_disable(void *data)
 	ethqos_clks_config(data, false);
 }
 
+static void ethqos_disable_serdes(void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);
+}
+
+static int ethqos_pd_clks_config(void *priv, bool enabled)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret = 0;
+
+	if (enabled) {
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+		if (ret < 0) {
+			dev_err(&ethqos->pdev->dev,
+				"Failed to enable the MDIO power domain\n");
+			return ret;
+		}
+
+		ethqos_set_func_clk_en(ethqos);
+	} else {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	}
+
+	return ret;
+}
+
+static int qcom_ethqos_pd_init(struct device *dev, void *priv)
+{
+	struct qcom_ethqos *ethqos = priv;
+	int ret;
+
+	/*
+	 * Enable functional clock to prevent DMA reset after timeout due
+	 * to no PHY clock being enabled after the hardware block has been
+	 * power cycled. The actual configuration will be adjusted once
+	 * ethqos_fix_mac_speed() is called.
+	 */
+	ethqos_set_func_clk_en(ethqos);
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_CORE);
+	if (ret)
+		return ret;
+
+	ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_MDIO);
+	if (ret) {
+		qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void qcom_ethqos_pd_exit(struct device *dev, void *data)
+{
+	struct qcom_ethqos *ethqos = data;
+
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_MDIO);
+	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_CORE);
+}
+
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 {
 	struct plat_stmmacenet_data *plat_dat = priv->plat;
@@ -781,31 +957,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
-	switch (ethqos->phy_mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		ethqos->configure_func = ethqos_configure_rgmii;
-		break;
-	case PHY_INTERFACE_MODE_2500BASEX:
-	case PHY_INTERFACE_MODE_SGMII:
-		ethqos->configure_func = ethqos_configure_sgmii;
-		plat_dat->mac_finish = ethqos_mac_finish_serdes;
-		break;
-	default:
-		dev_err(dev, "Unsupported phy mode %s\n",
-			phy_modes(ethqos->phy_mode));
-		return -EINVAL;
-	}
-
 	ethqos->pdev = pdev;
 	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
 	if (IS_ERR(ethqos->rgmii_base))
@@ -823,35 +979,101 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->has_emac_ge_3 = drv_data->has_emac_ge_3;
 	ethqos->needs_sgmii_loopback = drv_data->needs_sgmii_loopback;
 
-	ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
-	if (IS_ERR(ethqos->pm.link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
-				     "Failed to get link_clk\n");
+	if (pm_data && pm_data->use_domains) {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii_pd;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes_pd;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+		ret = devm_pm_domain_attach_list(dev, &pm_data->pd,
+						 &ethqos->pd.pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "Failed to attach power domains\n");
+
+		plat_dat->clks_config = ethqos_pd_clks_config;
+		plat_dat->serdes_powerup = qcom_ethqos_pd_serdes_powerup;
+		plat_dat->serdes_powerdown = qcom_ethqos_pd_serdes_powerdown;
+		plat_dat->exit = qcom_ethqos_pd_exit;
+		plat_dat->init = qcom_ethqos_pd_init;
+		plat_dat->clk_ptp_rate = pm_data->clk_ptp_rate;
+
+		ret = qcom_ethqos_domain_on(ethqos, ETHQOS_PD_SERDES);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable the serdes power domain\n");
+
+		ret = devm_add_action_or_reset(dev, ethqos_disable_serdes, ethqos);
+		if (ret)
+			return ret;
+	} else {
+		switch (ethqos->phy_mode) {
+		case PHY_INTERFACE_MODE_RGMII:
+		case PHY_INTERFACE_MODE_RGMII_ID:
+		case PHY_INTERFACE_MODE_RGMII_RXID:
+		case PHY_INTERFACE_MODE_RGMII_TXID:
+			ethqos->configure_func = ethqos_configure_rgmii;
+			break;
+		case PHY_INTERFACE_MODE_2500BASEX:
+		case PHY_INTERFACE_MODE_SGMII:
+			ethqos->configure_func = ethqos_configure_sgmii;
+			plat_dat->mac_finish = ethqos_mac_finish_serdes;
+			break;
+		default:
+			dev_err(dev, "Unsupported phy mode %s\n",
+				phy_modes(ethqos->phy_mode));
+			return -EINVAL;
+		}
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
-	if (ret)
-		return ret;
+		ethqos->pm.link_clk = devm_clk_get(dev, clk_name);
+		if (IS_ERR(ethqos->pm.link_clk))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.link_clk),
+					     "Failed to get link_clk\n");
+
+		ret = ethqos_clks_config(ethqos, true);
+		if (ret)
+			return ret;
+
+		ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+		if (ret)
+			return ret;
+
+		ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
+		if (IS_ERR(ethqos->pm.serdes_phy))
+			return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
+					     "Failed to get serdes phy\n");
 
-	ethqos->pm.serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->pm.serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->pm.serdes_phy),
-				     "Failed to get serdes phy\n");
+		ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+				       SPEED_1000);
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
+		plat_dat->clks_config = ethqos_clks_config;
+		plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+		plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
+
+		if (ethqos->pm.serdes_phy) {
+			plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
+			plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
+		}
+	}
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
-	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &drv_data->dwmac4_addrs;
@@ -877,6 +1099,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_qcs404_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_sa8255p_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_sa8775p_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_sc8280xp_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_sm8150_data},

-- 
2.47.3


