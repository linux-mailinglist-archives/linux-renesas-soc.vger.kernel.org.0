Return-Path: <linux-renesas-soc+bounces-28380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILgoJ5cbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:19:19 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD3F173C33
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8AF0C30E4DCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A48137923;
	Mon, 23 Feb 2026 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZW1CGSOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gev+a9X6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2E355026
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837727; cv=none; b=ItjfMJ6g+654jQ/UfPSZCHh2ipa49M3eBE/9m4VgXBv13xDhbMWi4nfVFPhwN41iM0aTcWy6jpXmxHFDppriw82hAKFh+UciovhnrIZMaNdi4lTm2vCd0K3NHiM6cHDhAILeuf2MmybQBfmIyMZe9IbiNXILbhFPZALmfyR8Z1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837727; c=relaxed/simple;
	bh=KM5YYy3FaFtr4PtvxBn1M4hgfoboT1uya9FFwL5qV+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V3dY3CepozRLvG/Rd5KiDBURg69IHIyt44UJvhoY9r3G+ao6jMnoLoXdZRgHBQE5tJCEkWAwXndeYuG5muPBzzf/Th56euWBrogpyhcVKUfMyq8cGZ5hsF5qftawe+KFxDSmcOGxyJjeJrQiGlsuoj0ysOJA314gaO55CDw4KSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZW1CGSOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gev+a9X6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMkwpw1483271
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VebP/75lB4Lk2oODvXgJoE4yXtkdgYDwv+c9JHk6z4c=; b=ZW1CGSOmzgUquQx7
	iby+w/zNw8S4jPWTBPFZXN/nwDgn8XJdEzJPs/UPhZMJb+1pIqcTL3GhKjWcaJix
	pRwfzEfdp8sMOUWRT0lrRAT7BaI+AqYJyfekLbKwMInob6H+9oHUaeyhxq17Jiv2
	EbzRJsrvB917kqvjL0MYDNT5t7LnD32rm4fbduAq3tUDp/Ak5dj7lJq2eUHcfPuS
	VRjqPnzUePooeohuu/zcGZoPFKo4tu4fM7Ntn3Z5WU2/M4OyTUI+kDLq+i9Xes1X
	ftOimue3iXd1Y+BmmHeWJhp2fHUKvaugcsbJBQ9i8goxp2d3RaP0TI+YqCHDebqb
	bcjGlg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v42y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a936d7afso523863251cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837725; x=1772442525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VebP/75lB4Lk2oODvXgJoE4yXtkdgYDwv+c9JHk6z4c=;
        b=Gev+a9X6seF+sPfzD+G88dzN9BilGoMVD2ehtGYrYODMZ7g3iPC8YSxDV035a0Mza5
         Uuzf6rOu+s03zxE2fQ1HDYMT+zk2UEcuc8Pnd2c6gGNG1DbIiMKKkYM7a+dTHgcui4bh
         qRczk4KIpG/5kCLxE45ugbHB71yQC4DsqssdzBE7hmwPnK1Qe0jzVrvIaxWoYscnBoEN
         5UhzG/fbBp+ocGHhflUTMmUzrK/63eg672hbXngB98l9wjef0qnLQecnVR9svnA3ZIKJ
         2YkO5Wqrjv+vyYDhtST/5sswHPS8e3GVSZbHZR9Xl67wpCgMsI9QmWTbeQjn/f1UFnf4
         KhNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837725; x=1772442525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VebP/75lB4Lk2oODvXgJoE4yXtkdgYDwv+c9JHk6z4c=;
        b=xBuMMQc5LrJadwqCMQuVQObRpn7bRgz0lFCmHHN9wxqkZkketQFllA0d5uPfwsAf6F
         JuApzT9Dj0NBc/8u682n1JKTkjFc0XWUz3iGDGmAuFIXCE3xx5+RyG63GrhyZOc5FwyJ
         S4cveVqPtvBE6WkQ3AGobS1wIMiH27zv+Cj+A2IFgT72K2OB2rxdLcRgVm3cZoEIADfJ
         J2OaJlpAOQNKMpLB+Xg823EuZbuG1i89XLJav/jzKN5EC6AIKt+ewdBCCqbfMDDG0W2Z
         dLMzIUuqxUdCmjn47lM2bG5vIu70new432Xy7aqmLOBiMtd0Jcn6+8cJjqfUMSnSMJGF
         E8fw==
X-Forwarded-Encrypted: i=1; AJvYcCWamyiIoebanjPGyIaVzxXIiWcDTFnh2t3R5MWU+atwwlrVIvU6NcSXod79l8MMJgcPc5UlzQEM2VsWF48bftMO4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFyX2vq09WpikttzQ+nclDqhSRR5bk/T2lTP6UtNtyEvXN6xo
	wqRo35csyuA54vZS6dk0nshYXDsTbkTeB96inkpg4BysJQ7uR1ibX2+ywLoA6zoHZKNbUzIZTnC
	565tCZ7sMyIPjPX+im4LEKKsdet8MGfNdyNFluV7LhvizEuJ58VQ50jx5wQQw6R2NtfzXKveSVA
	==
X-Gm-Gg: AZuq6aK+yUzFgJObSKuaVvat8EQtsfNvM/jMRp28ZJow9SIqbRHOQqkKLiw5j7Nam/E
	vRoPnfOziVS2c61e4T2j3SxLrREt0vip4l25i0quNHuPZm9qMPTebfYy/IjvjF2Um4MMNj1G9Mv
	i+iwwB8S4ljFNlZY6ByLdXspP6btjMUAohwp2HLeVZvC75Y+114HKECifAuWOJWeldtqOGs5gf2
	30sBpQY2RssyZrxwyYykRzLq+9djAiHXaExCI7sQWrNtqxqzCmVEYr4SzmcC6FVcFewKgokM/hL
	BL+JkLHo3u2ej1r/T75OHW+7UhP44NRYW5X4nnZUqVnfShEscEyudFZrKK5pOU0oE/YsJsnZLd6
	37L4ERhzxDEv7RQjhB6esx01dXVSykooJpf4pCDpHaMwO8lM4UR37
X-Received: by 2002:a05:620a:4486:b0:8cb:3b09:9cdb with SMTP id af79cd13be357-8cb8c9d2882mr960206885a.10.1771837725295;
        Mon, 23 Feb 2026 01:08:45 -0800 (PST)
X-Received: by 2002:a05:620a:4486:b0:8cb:3b09:9cdb with SMTP id af79cd13be357-8cb8c9d2882mr960203785a.10.1771837724833;
        Mon, 23 Feb 2026 01:08:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:26 +0100
Subject: [PATCH v2 8/9] i2c: designware-amdisp: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-8-77018c536610@oss.qualcomm.com>
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1215;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KM5YYy3FaFtr4PtvxBn1M4hgfoboT1uya9FFwL5qV+o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkO8POlzYJp+NpeAM0jvZ4BRXDGL3QCvcpcc
 uZqjKtzOw6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZDgAKCRAFnS7L/zaE
 w+9oD/48uurBu4tKMDXYwBKRuAdj/3Py06Hy6I1lKIqfT5T4qx4BrULp6WkjkLdGEewsmOLik8K
 JrdAIFpAD3hjaBIyIB2fIfRiGJL3dsndDld3rK7iNcZNKUnw0HSuJKSHNd1OaI3vFqFGoa9xkO2
 I84XnF5uzV9bW8mvoEU+ybE8SP+I3zIgD82YQgdRW0d5tUkv85CwfEXog7HTljf2SbOaSfoOxtT
 +TLLJPApnghisJ6Ch3SgXP/CeR8QONFygFhUiCFQdWnrPUqmuum315stVPX9P0fePSnjdxHUgeU
 U3VzSp55AaQSGtZv8L25gEakmMtvRl54veMfA79bqBksJprb//fOBuk7E0fiKocOtTzhomq2Lsy
 m8gXPwM4HU+4pP4UXSYWrSgYK+NQWH5HudFsqVLHGFwnIbhV2XRiRre1DdtSg+lXf7QAo89MZEW
 SWsDFg+TPhdZc20/k3VTkVgOtXa8n20EcmO0xWGIUycDdqXFsCccLK0hrfAWcGo2AtsT8Yw2veO
 gc3NCtJ2TX0xDbMJpTr72cLeoxQZh6Mu8NvACx/wCcnxL25HddR4VmFGSZ2qCVzkTJeBG9w4Bkc
 1XclTfom69XrKi8X81IZXgomksMyuY8eyVZVly5Wk0eHmp7uuBbwI6U715q1QvxN4H6KbhY5edV
 q9bYp7PRR9DQvDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0rcWSdJgjt3D
 oRglOuY+dTeiL1x+MJn0s6hNRfsnAGqZkbtlwXcvf9b3exuZ/jmJ/7sYgLAAzaFsBTudEidnlUH
 Qg532kvHCTzBw6H7hRbnUMdwkCWPKsywI3xTkPc/pezoBGACNdNL6+M8D3wGFqJZC5PS4qbv4TK
 sVWE4YrlCPOVLH0bEGxZ1e5+1D/XxZQilT/aLiXQhRBk3obaTWNNQ4IWJgmoIzFRQ+PAwlVB65O
 wQSI25vxqfcy2p3k26HCcTTSj6ro6CzntermpIVQ4/RBWkvXg1dX1rpw5lnEvv3JiF7PVq0mZNW
 ZFEAMYhzxJLNBp+pNFJUGpi7cgKQ3RzQ6YWoMffTY3Ot+m9o9UPusvZfz/XzW/oOMC4AkS8tme1
 sYQfvmuQVq0tZWVDr2JYOzbNSJVC6IhaL2cBXA2e/CT2P7CzX+XyJK7gbiXwhgrAYYa5s/blsMp
 NMOmnq1QQZ6TZAClGzQ==
X-Proofpoint-GUID: llsNBq7AQ87Jvw4pc1Gx1moGh1hU4_m6
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c191d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=Zm9YSbcrgGmIKEIR8VkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: llsNBq7AQ87Jvw4pc1Gx1moGh1hU4_m6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28380-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BD3F173C33
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-designware-amdisp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdisp.c b/drivers/i2c/busses/i2c-designware-amdisp.c
index c48728ad9f6f25174515defe55603d67b2491b72..7cbfd441bb16ec1045a2546d55af3cce774b462a 100644
--- a/drivers/i2c/busses/i2c-designware-amdisp.c
+++ b/drivers/i2c/busses/i2c-designware-amdisp.c
@@ -61,7 +61,7 @@ static int amd_isp_dw_i2c_plat_probe(struct platform_device *pdev)
 	adap = &isp_i2c_dev->adapter;
 	adap->owner = THIS_MODULE;
 	scnprintf(adap->name, sizeof(adap->name), AMDISP_I2C_ADAP_NAME);
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
+	i2c_adapter_set_node(adap, dev_fwnode(&pdev->dev));
 	adap->dev.of_node = pdev->dev.of_node;
 	/* use dynamically allocated adapter id */
 	adap->nr = -1;

-- 
2.47.3


