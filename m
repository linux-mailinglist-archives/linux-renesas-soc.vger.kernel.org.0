Return-Path: <linux-renesas-soc+bounces-28400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJRDGJ9YnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28400-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:39:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C8480177106
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 059073054BB4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1AE22126D;
	Mon, 23 Feb 2026 13:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzKXoOxi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UM75HRGd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D24121CA13
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853876; cv=none; b=PYouyVQw0HgBFwm5Rzo/WhwsNqYzA8QvWZYb3VKc6UiF+d7WepDwk7a/wh9GeAqjC13vJuOOBhM1MpQDPdsB6khrUiV/Y6VDCRPzrXgY513DHwu2+Ws1THUV+pUqK+KJd2/jOJqMXbjqdbqvMFhrOp7ly90LbxNcO2d32Ph8Psg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853876; c=relaxed/simple;
	bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HLlMX/99aku80mFx1STVe5K/ktSawMOkJbxhGmOhPYCggTG82dmzUgFVOoe5R0CQoAX6h9oNcYUaBp521uOhDz9wxk1VtSYRLR5AeFRc+As+7IawLz2z0zfJL8hpLYMZivNWMn8KmoMOazz9EhF3Rd8ynPzmjju0ETfaOoZasUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzKXoOxi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UM75HRGd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N85gXP624267
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=; b=nzKXoOxi1bY4uY6f
	tR5QifCU+ODEzdpPNtpBb30VXXdbcFX5oPrIf32P+RL1prGWNb3WkWVng4H9wU9n
	RVWix+32OD6W/2RCVs6sC+7UEuzEzYC+kdAiGc4/caAz+S8XOBMZmg8w/D926Uvr
	sWKrRRYqMAB2cahVvYOEGd32s9WEF3hRoRGulqAJAqA9/7TeXNWzDB/OfdKE8gDN
	in3i3Aqf5bi26oi0UjSuhJ9sa6zQd7hdzCWDkeDzHKQDFk+QYcJZR83JC4+UnhVX
	sec+mtHcIBvBsFhgXbQztpfjJ6SgiXiQ7WnFWx8jQf2+7StJWGOcPFgfsQzv2EdH
	eeqPcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so626109285a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853874; x=1772458674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=UM75HRGdPFBAKDaHXUviUxjlNvS72PCvuLHH8I4FN0Mc/MA8hKWV2Oowzu/B7I7F1i
         Aum+cBHIKKaAIxCR4Vgi5ulhLHCz1sqU2Gtv7QHtuqxFPK5a+GFqEonOd/11rgW7ctxj
         K6yleJ99ENX8RkbxAMQpVWIJKKD999PYXElhSK+6+vC8r9+TV7UC2jSpoiOt6kbcdmL+
         sx+ktU4+4KyAzT9Oe4iKr/CoafH+T602VjOWW51jwfUBTWilX2K5MDekIhJnpVoWMkPP
         yZzyyLvyL0Gc4XdjFth5FirTp4efzMuZePaQlDAAV3kdeYaCbbe3Yq89StgNyhA3Mv8d
         QJIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853874; x=1772458674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NDCrEzz3kV5sATqvqzBOn/sKy5yOzOEotH0CW3Bchds=;
        b=JUPz1LfRpzVl1uplkT4IaK31r5xYa8n0fspn4pD+G13jpVllyMU4K/tJbO8XyQVC1G
         O2MSk5oUH9pfkxU5ugy1VB0+QLX9Rf6TZ0p2Im+tEU4xa5T96NRH9D+pB5JtRVy8o81Y
         VWnVnTviKv4iIehn/yjrs0aeByZSB7RCVXmsK1vmQDaJGuI+QemkViLTy3xrrH41daRG
         DVU0Fdt4GU7gVoJH+kIToH51WaIrKy61f3jz6e3DK4AhCD4I8ewSbjA+05U+3l3OgUdq
         FPx2mtC28SasEoCwAS6m1UzSB/yaVEYgUvIc71NliHdjvGSJZ/rYbg6Db20bwEeA3GP/
         XsmA==
X-Forwarded-Encrypted: i=1; AJvYcCVENyHXQo+t+Zh7j4jptr9AiQ3t1stQOX4IWoMhiUS97cJXctVi7QpN3RFDk6Eeh9Qj5JFtE2uBXD7AnJU92mpiKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27YEy0qkhM7eXjQAohfR0TueN10nn4X8zCDltUpr7bQNCcYQx
	X4Saret2YWH80h6JxAB0rMjRKX/40boFAU+ZE/ECvO4JoTGTxXrKJVmV93riLWProiUJ2LsMQxb
	IusmAP+uJLffbBUt5Oz0aphDhjGMUrj8WzvcTs5qePRMWk2JOrx0Ls4caP9KeQijatxG5JFq1ag
	==
X-Gm-Gg: AZuq6aIVqrMLegm0SIsZnDevEC4e0uSGq/ARk6TYv2wq5QJBFZtCEXJ0WwUHLE6q1jb
	vz5pBNLwDOSoU9pxU/P7RnmMPOL6X4RBS4mkfj2eZy53ed0vaZ2dQamTD2Snmkft3KGib17Fe0S
	KDOpKpRTkxdnuYH0wXIWtes/T4a1vXyvg9gSwltEqqSlsX0KXqzRjnUqRe4U+NAFLIhj4gQ9wEl
	S/ZWYiJfMn8qqo/AY4SmRwtqHIiXevGPLrMLriFKNjR1o6cGtB3HtyzeiUMEBeUfB7bynqUaCWb
	UU/lCSC/zPu+hWs2W7gz2UKcYGqO6cRmugZgQHkjk0jT1495eczHHug7YttxrKy0ieRhx1wxvLR
	Xg/QFFbFgZGWoUh6moWNEPfMZyLty/C5CBbi7IQCtgK6Phyocw2E=
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996161485a.51.1771853873859;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:bc2:b0:8cb:3fb3:7bee with SMTP id af79cd13be357-8cb8ca65f6emr996158085a.51.1771853873383;
        Mon, 23 Feb 2026 05:37:53 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:52 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:20 +0100
Subject: [PATCH v2 5/9] soc: fsl: guts: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-5-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1822;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+XjiWoNFsFPVem7xRnzx6aq0i9FMhl7HvhAWwW/w6SA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFge4NKs5b/HhZf1FqytouviECXWv4CCayjyG
 d2GXKvSbGqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHgAKCRAFnS7L/zaE
 w+AnD/9o82yUVcRX/EDQ8/rDuhAdTh2ARj4bZyZcBUwlc2QItKJYUxWDovnXoZAIJgHTPdXvkNt
 5jY1LxpMojb/ytP1LIZVcjj4CZeP576Vp4g+okrBBq0flZsfk+pjYhYudU7x0W+DJU8R2c6tMhR
 eg2aR0FEEY7kI6pdoUzDoLUp0Lnkw6maSVRVOD38LY/rOsdoe8H3w4pccAPnL6HkTwAAI9sRemM
 stnYdqeTohQktd73UDF3oyLdoQUlNcIMWGCdktfobl/DsGcWX8DinfBpx4PVxFwinDExsX2q23/
 FE5ho2KZlH1ccbvjFOugOdsnRZKYUHFsH8njc441CExac7ECXdL9lxKXh0DHGxPix4Se/UiU2RY
 48AucP0vyJT+EQUWm6t/KFhx1u0KsB0S/AZB+4anFOiTiCQdwi9lfJGE5QnfghNVwv/HpPyRaFQ
 GAkMfxvZ+klkP9uJQwDhHBMSsO5oOuiiYOx3H0/rP2uVjHhwEb6vNv1+7OXvvR3sDIqRONxFVIY
 sZQy7dQlB0NJCSPTZS5iHvBq6b6Px9ywpt1pFp896x/238b7PhE6HZdhE4SrNxaOx7/IcXkFEfp
 Tf51sYJdhHho5bc+m19NDDMTXN/fgysqxUXUF5QJliJI8uQutdcsY3juWrvuFIw/tURqSblK3aF
 tSSWnHAI3hqqIfQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX5LslYsUkgrU+
 HNVhNcPG/2hI5RuoBkcyLmsZuzbfx1EavgviWMEZhTlNuQqV+7bzU7A4hta/6+Wzq8Fs6lKkg1m
 4xHo3llePAp3cpMeL4cjWIoGOWjdcb1V0507qW7VE+R9fx7bd1gbafU0TGRlwzImGrubddTTHL9
 RX3FjDDPmK/4nYwgS3W3Si7h/iM82s01xNItFCoDWwj0VsQfzmMJIGe4UfVh2bynBeg1/ho0k5y
 YuVxYqkuXFVKWtRSonelRxK/0eZe8udfmBnownEA84AvP3mmnaYup2geLIX801uU6VFE61uA7C0
 2h2fk76AnwDDB6Ii77BotWJgRR6PvYGiByRjjD0SVvH3t/mCE3g/Hk8ZlUDzy7+I4sfsCp8p2Tw
 BfKMaOvIK1Fd7Vqi8QDXVqUx/Ywq+/VH0RstRPPhsBFzJq31tSC1BhB1Ao4RWz98rvmX+vK8TBN
 fzQaPFJuvYk/VN1cu0g==
X-Proofpoint-GUID: 0bRKVLlizKMP16KY4pz4YRyiUvsJQS49
X-Proofpoint-ORIG-GUID: 0bRKVLlizKMP16KY4pz4YRyiUvsJQS49
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5832 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28400-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8480177106
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Acked-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 40afb27b582b1bbea004ca91b96d0a998e7a6582..9bee7baec2b9b3a548b16661f9ba86db2b982910 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_attr_read_machine(soc_dev_attr);
+	if (ret)
+		of_machine_read_compatible(&soc_dev_attr->machine, 0);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


