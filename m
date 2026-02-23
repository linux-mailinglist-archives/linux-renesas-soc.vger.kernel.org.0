Return-Path: <linux-renesas-soc+bounces-28382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJL0GwocnGlF/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:21:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEA1173CCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7266303DF5D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F61613D891;
	Mon, 23 Feb 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ACBMi7vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PO8ctH9n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27534204E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837910; cv=none; b=r3FHDz4b0N9XcyQmuUcInYOtwG/xe88PL+pPdnrMlCOoierQsipJ6T0/vBfMmNDXatFy6NgVN6+2DiajrwYwEhVEiqcHIkrv330JEMMZ1ihc8W8wtxZShjUDwUYIvCcxGhPwVbGYUZ08XJmueCiuOH1/PuaMXE/n5ZjpVQijlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837910; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XbqeSfyOBVev8CUr3sCbdWIG3uD8aiovKWTR18fxcZxFayPgJsW1IsOa4PqoXqpo8lCHAzvnpYXfIwaFWYchFWjlf/fgQAKiUGECOUAxMNu/CR5XcNx8hLSab/qhNL4GUAJzUEQW2VK7tB/hteo/NwW7j7LGTJsvVcHk4uG4cA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ACBMi7vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PO8ctH9n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLEcif2079023
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=ACBMi7vxntgULb5J
	Sm4Of+obwXTOgWEcFFHqcz7jBmTUkJDiJTEQFCDvLXA/xcEcfsWZIKkvpJx3ELvl
	M+erOMeO8dpd1F/M2lVedCmuT3cVHAdwG8QZZmS2AcVRcWyv6/4Yl/7kFgACiv3r
	M0KpB869Eqi5c0s0iM3GUF1eXjREy+S0P0H3Htf/nB3cUKlS+f9qvT/6jhR/OkHr
	fsgMbYD5aCnZ1yAy4IlZZDMAdcUhxMPZaHwE5V51cb8QV7WwcHHyMm+mNocI1oRC
	CCH86WbjuY3aVhL069J7Cb8lMrvMgNoGowS5OLxF1pedVxz9qHGw78HJEkTgYL9F
	EKUucw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v2mb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:11:48 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4639e1fedcbso52714179b6e.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837908; x=1772442708; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=PO8ctH9nm9987Z3VTnup8jhooAQa1w0Yj8H9n0WO7/TxFhaPc4LRStnVFuJFEOqMY6
         GTlZzN/8NAbxHUgng7xpl+FKBOSO6Q5h9aMt/kE6dG1lYnZvhzB6Rx91tUNlUxxSF0Cb
         O11Vqvw7NKucJKZ1iZW0t0faDqxJ5a3NlhkNt6t5dmG/ZxL53cjk33maG9U7YdLzNS0z
         PbRFcGyZyl3v9re5yS6eZLSHZLxFKOGIKKagBwc+l87rJrZQNWTDn+pe/BMHIs2W/QHt
         RcY2rxzaoUPpbidJTKdpj1ZYZlKU8ADVuCoG/BwbeSRs9Du/sLI5sKRRQPeaTHN85NGO
         WDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837908; x=1772442708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=MHZLOGnoy6zRLF9Yy52f/w6ER5qS2KzknEEibrpjgWusjUd1gCypx4LQgiSwP+NfkC
         ntJdSfAlM/TmsIIxGbOlC+rfSeN9TIQaEwdosdRPXdgSSewiQmhC+OPpVDnbZwSpk6I2
         9fngu2IyBh6bkbDQR9JGBHf7iiyNggZXaNBqSfFA7PXkCK1BriPKVBn4GsJ0yboW8/j1
         7iLuJ5iYtF+2adZsusSHdQ33NeOUK9P5oO62VKxjqYGwPuz3I/MbW6a3nox6kza5SMoK
         jnImyeHXiKHbf0XzYwbJRPIfsCgletG42+4O4F43CAF4I+k7JhOia8iYSmqPaV/HBAK3
         Zzmw==
X-Forwarded-Encrypted: i=1; AJvYcCV7m5DshsWxOFebr4OZemmSZQvi3h+fCpBXlqHYyKJnwt8FSCG5Uwgyr3p7BUWE37YAeEPUbPIPnmV9dJTYX3Z3Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrpWiRkPgckynw59jTez6E8tFvDre0aW0R5VO4pPKl3C8TW3T9
	YDqyE/rrPn0NtssQ+K3d0idvG78243T8UFcC4QLuXBo2RHReDVXbR8sV2WUZ/UNHPfdxaqJKFbL
	v2JJ7C3vbsvma1o5d1h8QJim/6a7nJJG5+AFcqIX9Al6AhMPTToF19xTKXfG5Cy9aBKVRiJp69b
	cAi47ImA==
X-Gm-Gg: AZuq6aJSORIcRv5t7yW0caVDuyoLfJoXEnrX3pw35VzAd9wssY1+bfmpLPKbNn4SAK1
	g5cJ71AqOqSYRkS189N+3YbKZSXA+CJI3nD46DiXvcrNgwHUyLd/YKdZuSWbb+5XCbmUblh9gWM
	Eth9IwC5PVYL2NzrMjTEn79S8urfFfWcCgiJDpA8udb6sRJfV0mv9bKMd6GptOFxIODGzSxiOtS
	2MINHnlNuup3z8qqBDvkbJhpX+MOnDlzYLnEJ5oImPfBVeX5Ov0rYjeYjqnAHhkPWUs2QgwGwsB
	IUm+SkMH2aBuHPh1Mxl3AO7WzNQG4hM7DwG9KI544MEkK2QiNvdcEaWGnoeUDmO8ON4cxn9lDZc
	KSt4Q8eHJKlZtn3aGxaraIkQDX+6BbWNJakoR7ua6Yt+G6+7zatM+
X-Received: by 2002:a05:6808:1483:b0:45e:e1f3:e26c with SMTP id 5614622812f47-464461ab559mr4675147b6e.14.1771837907954;
        Mon, 23 Feb 2026 01:11:47 -0800 (PST)
X-Received: by 2002:a05:620a:450e:b0:8c7:13b8:8b55 with SMTP id af79cd13be357-8cb8ca6e6c6mr944315985a.46.1771837590759;
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:30 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:56 +0100
Subject: [PATCH v2 10/12] i2c: gpio: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-10-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh5L9W4QURdlXv0MMYDy3Wx+w14PFc5E2/TU
 a0C5IUrGYyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeQAKCRAFnS7L/zaE
 w1AvEACvwcgSdpL3LU2XuYTrJqc2aiozZlmvj3/1Ie0jMcJEH2AK45frU0bCSRvr2gqCa3Ii60X
 6WLZVGY6RlNRcdxRXLRSZBvSE0Eoce6hkv6Q5YC3L1/cw8bbzrNV5usBKi4oO3Zm99AILawCmwd
 zJ+97Zpcy7O2/PN26x+KI5d5VP1+tngkzEvNqH3Nla9aCUt9PpyjL1f0AVJJb6QVS+Lknv/Ci1W
 GHiSaZ6FFGvYN0mE6bz2csmla16RJ5R2WSSWG3wGVcWhwECiQgsRSByzTQO/NEgkl6ppgN7lCU4
 8vXuo0q0t/6Z5pjWzh+HsqehjDvdQzAhjip0VqM4lr7bjbhfjxeHbYytbLQbTwk8nQU9WeTFJza
 B0agd251nKKlp3X2vDs/zC3adAlD6rqXJG0Rekke0GvHOmXCHDoGI9G0FHspKYH1R6IQESj/atf
 RFAxptAGIlRdEyhIssjv5tEk8tNpkgV+aOdxx5Ww6XJXcURDTdiVmts5AfQFkdMd0GVo9xAeXih
 xNbmcFwpHrWa5hjOt896Lld2Iw2ooAPt60qFvm/35aEkwP/nPU/SgLJGtHB9Hevf1KvleecWkwg
 odc4uoBYOug8l9+6L6rue9mcvWyrA+2VwZWcYKw5+CK210buMCsqUZJkbIZDwejQ88avb1U84yT
 HJ5aTEt7TNzEmWg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c19d4 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: BBnkkEhhRYjeCbQW5dKk_J1UTcYaliVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0HEuDpSZoaXk
 iGcsH+0+FOTGrZ92m1YFZMMzOHySPM07ajPamHVB9Ig8x9N3WDJ1NlsOgBcBrvcd0uhAUKMsTeh
 APaS6+bIzJi0ynE9zOmHauhS+nitXUx6nc/zIAWjme13pcEyS1TTIcuqhfn8DDHbcuJsOo/XxQt
 zHDIkKwiHqLdLEg9efxpDxWmaPuyBf5ngXmvSf7P4ojn2mFnIkjMZUAvK0rijgmtXpM71YoccPO
 jRiWhQdAHgqoTrCQaO/uv91OOrTsc9ib7KblBchVBgdtoIe28DSo6O4y2u0Ek9y/fRBl5hax7zV
 zl1gPbO1ZttklEsKcacSH28UzALfSiM6qbe4Ch9Xrg81nMN1ubvCuKvFzixv9DaD6lwATSvtf78
 niLVuRag6ZWpbcO3k0hC3KZ/XBIbymZ5KCXLmZsclDWUr6NM6W9Ei0U8gh1lnUcCEL6omjdyaey
 MHSlerYi8/DcAEE3vmw==
X-Proofpoint-GUID: BBnkkEhhRYjeCbQW5dKk_J1UTcYaliVa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28382-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: DAEA1173CCE
X-Rspamd-Action: no action

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


