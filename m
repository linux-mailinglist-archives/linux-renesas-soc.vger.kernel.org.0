Return-Path: <linux-renesas-soc+bounces-34760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mtvAENKtS2qqYQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 15:29:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F437114B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 06 Jul 2026 15:29:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=or4nvSXM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=js+Cd2SH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 980C4309A880
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2026 13:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887B2431484;
	Mon,  6 Jul 2026 13:21:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ECB341A77C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jul 2026 13:21:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344070; cv=none; b=gKEGPL+T7hAbvxvkURuQAvqFiL9Kg2PB78TTFmpW0AC2EWT2OaypsgJuhKL3WRp3rXq1NDmE975nsDydPtLTlNY3jPyg0rr9LbFk5VZ9DLfboE3RNQ5PYdPophQTIhYC/sQX5qj+UNRGlgUm1BGaGgGbhr5pP4CRlqqFQcyAeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344070; c=relaxed/simple;
	bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bvxBE0DCw1PdHKRrSND5NiDwjCcU8BvwpFit8fP4O8ZWGZAh8H1Zfm9Y5OYM5tdxuLUMVfQ9ShcPh/1O0LMRlo5Cw+YXarqWtAE9RtWnXf0fiN4PgEUcIWhgrGYHqwl2qyENA5ZOcD1Bt+HeL1d36itu0CG/fLLS5VUafV3k4Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or4nvSXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=js+Cd2SH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJX0401678
	for <linux-renesas-soc@vger.kernel.org>; Mon, 6 Jul 2026 13:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=; b=or4nvSXMp6OqVfrb
	eTPyTd+JNIs5/y38nBtVyWwIiW27rsBdQRdvx0sqzDSt1N13hZdTRnfo3Os6Hc8U
	Y/gk63ZssPZx3V1THQq8OpawsmWcXnUX9kWKPu8qJZpYArT2IiRRxuNPXXcrvR0f
	+7tqkw2pHa2e1blkbCqdhFPwUcX1XSZNNqFS0yzqksjTvbvPrVa8ZbtkuA3Mv96R
	kqAOYnJhAaM1A7UYZBsEg0GK4J5pLn/PgeXTlkEpgO1kvSfFfDeYNfoawKv9eEBL
	JGtvkUNAI+9L6k7Fyx+WBSoZt+2d0I3j9JhzEJ6amrd6l5hLWYDqGzNeaT/hNHiG
	XAl5uQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grsad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 13:21:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ec1fcd5aaso4089209e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2026 06:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783344061; x=1783948861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=js+Cd2SHFOgbVofPkFKQWPd5uBUwP4k9dtsJdMWGuBEIn/X0faALDPds2XJIS/7I5P
         bTsJXCHb9Av65EK1jtVsqOc9TfBpCyjmwqDI7gYSvGueJT4UshEGQrI1t/AzRCGGYdGv
         hDAoVsTGMhF0mtehq0+uLuCgXTfKApUeswu1Ks7hU9reg3UyUNxBY+ZFqjQfJuS66pW4
         DPx/eQZZ96MWBhdfQSmN8fyW0s0F0SQ17MGjabsJIsH21HR/JBKU1UGC411JfBejeh+6
         Rtkwwu4i8SIvgFQtkXEkwlL+TF9rZ/dJGaKkcWqmPe1x+tJZ4+1KRIcy16w/8LFmRdj+
         kuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783344061; x=1783948861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Q6bqQDHUHrjtIHiVjOhXKx+2i7lMgyb4QA6T5rl8AE=;
        b=tH3GXt+pwU3o4hT2JpCALNbpI/zI+z58JI8xB90Bbm7E+zEmeKHLkaZe8uRBTh1QWi
         KVRs1OXi6MkDYRCvNd0IdTiLTvyapWb1RXU6vZUqfUK4hNE5M/o7ZvO272IaqSeqUxF6
         XdhVwkTxNimYD70nhL6/+8z/esUdu/IjbkQDjwaD4kABaFvNzNb5Ccb2+e3ztzQxaiFh
         Zgnh47Kn2bOGFTm+YJDB0np1IkJu6zhsAB5BGRFEMbY4tweiLZ1m3wuwCNUiqzqf0I2s
         5aWcWuUwNdlejRUu2Sa30VoexkzWdMBNzIu092wTaGOPnokLeCRTNzuVkjQaEbaEHvgd
         W4fQ==
X-Forwarded-Encrypted: i=1; AHgh+Rou1+Giofm9SSK3btEfq7F1lPcMXQUVmPlydzbeyZ291DvwpUN2elR8t5veWtWAcvJ+FDvOgvVGQF4Gv7ZWdhHGgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFzrFfseyOb7BSSxjS8P/C8U/63c0Zn35bwPxvVqbPCDi9Ew5
	kIUMs8+Yha9YKeITUNva9yKS25ACwlay1pwspFNkdO3dVRPYE7jzkCR+xt7p39F+dFh5OcC4W/9
	a3X1wwNpBNwLqFdwwLn1bDqNS4hMuzZWHEvkAuknkHEemR07OggpLPYzn1YeY95E3aBNA+qEijg
	==
X-Gm-Gg: AfdE7ckZUkcEZI4BS5ccStmcfAISki/j3ULD4dxnTbooPTpDwAUnqr8ZwzPWlUebj4N
	D/K5KUmiDcsoq6xE17p8gpiubzkVdfxXvov13q4eiChcwLpTIcyVHU5jhmRojnqwH4AzPfZLrmO
	koim5nfUWPDX5v5No67kclBjUSWEBWxsQm/QSNd5YSr9TZlG1Y2sdNCOlLReex7Ti6fiaeSZkiZ
	+RCrzFyK5IzWgRlm0AIW4nN8ALXwO8iogBARyVloZVmvjhJsJXffhv/pkropl5tNzeYXDiKWxpX
	i1pnToxN3No8MUwuoA1/8o4zPL4wJxyyl36nLpWEpOTmQMgzLPMbf+8ChZj8eb+Ik+0uFswrn03
	2AruoVMNrorcPBsCLaTpgvYtkji5/FI6GCOdNrxpD
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306950e0c.5.1783344060737;
        Mon, 06 Jul 2026 06:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:e469:b0:5bd:73b5:6d25 with SMTP id 71dfb90a1353d-5be9074e753mr306757e0c.5.1783344058691;
        Mon, 06 Jul 2026 06:20:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm25910584f8f.37.2026.07.06.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:20:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 15:20:22 +0200
Subject: [PATCH net-next v12 7/7] net: stmmac: qcom-ethqos: add support for
 sa8255p
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-sa8255p-emac-v12-7-e3ab1ecf2901@oss.qualcomm.com>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5134;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zlpwRA2B5tVQ/D/s7B0Bufz2lMNZ9fNOyqanrb1FAug=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6uitXkpHF5K6Rc5H2juaPjDX+WdM0SlZPmHq
 rC+rjBIaBmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakurogAKCRAFnS7L/zaE
 w9V6EACRebpawQe2y7q8VZHMF5Y42eILGxBCttoAm5H65PSgUVQIlUwIiie91TITslGf5GkfU4R
 NZDfOFhlHZP8QhMdbPo0XqoQ24wcBD8Q+U5WU908BLcT4J4OCJtcMxuNOp/rdZQE/E93Sv0Hd8l
 OPhrOU0PTH8fhGTchTD2K4tQFgb7pr90RMRAppVv4SKzEiyAUvj0Ul8/wX3Q0nFimqcHscKdkmt
 rbOE3KqwsPawJQX1R0sunanImePVYIuLYlDCRqsd8Gs7bGG7+o3lyInW8dgSXu+lgON9PVN65wI
 mOnx1/MU0yLT4b+RjKoJIYA33MCGDelkZ4HCnA/tfDnSc4IqkBWxnruSz5ISHLkp6sEt3zLNKsL
 lw/xWNA4LE94yiHdgvHNGYEjFx7nqlb7jdBHJWYoQ/Kov5VL2r/XnAk1rbZgJtwFMEn4DrukCKS
 HBfrU5m7X+z4DZ/OZDXgya7jaUGHXIWkEFzxJrPAfxQgzKmnS6ZCrbAkUJ4mGIBXu9cGHjRtUs4
 Bgpp+/XklqZQJ2Ko1981ir6hFumr8jZempLQegHyOBbH8UsA+zWcehfiLbHbBYjDJ1mKUYeLPle
 N+SxIr4y7GDZ1lBVUVVonzUoni7lV8ckMooMvUb3Sc/6osTOnmj5+PxEbF6JTEiBqBxFBHUJDMe
 xp5lM6RKQ6LdHJw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Fm_rMjISZKzHZbXtvSDQVhfCg7PL-Mdd
X-Proofpoint-ORIG-GUID: Fm_rMjISZKzHZbXtvSDQVhfCg7PL-Mdd
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4babbd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=RTgpwGSXUauNkVmvBPUA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX4a9ZPpeOz+hL
 l2H57mxJnfbKXE7POUzHV7K4GjPxT7yuANvsfl8PAkfg9BC/STUllSmI9BQrj5ttbhpWckByUph
 zH6YRlvu0XbGUhDSPJkOcqxEd8k5Xtg8UBfwSjdRUjeKGbIwL2Jd0UKfjZox/3b85zxzCfZCFQx
 /fHghM5ax2Hn4o/tX/ykWTmnFkIYJlGvQ+bGyHwjNl2a8H3o4PGBFyBU0kmrzrXMvhem6khtJ+V
 RZ6ZC4lkM/FZLcR7C/fakbX5oDEKQI9Y9IzBRehTy4Bt9i8aqb7L+KIFo8KnrUajJ/8afblzUTj
 B3CvLRIweIYRO4qhpGQ33/bkIF/KThGk/Aw+GpUbWiyc4uovFpnzjV+jHRHARHqAWDOb89dyazI
 TMionr2a+cK3yho/xXMCT7PPxhiCEWA7tAJao3dXBL6t6I7877JwCNrhq4yiANXFn4dZky5+iRT
 Dsnx0gn/ZVdcUOPWQQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzNiBTYWx0ZWRfX/HhTOWKpJuwN
 Oy68LlvTm22OlQT11OrhlCKYmppUQMH/2KRzO/iU54ezZQcYyoFrJAT8w8sjsk+BnZ6pFhWvQmA
 lyMhanVWdXWy2jO5C+i/clmKz5FBDb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34760-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,lunn.ch,davemloft.net,google.com,redhat.com,gmail.com,foss.st.com,st.com,linaro.org,baylibre.com,oss.nxp.com,nxp.com,oss.qualcomm.com,bootlin.com,glider.be];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:vkoul@kernel.org,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:shawnguo@kernel.org,m:festevam@gmail.com,m:jan.petrous@oss.nxp.com,m:s32@nxp.com,m:mohd.anwar@oss.qualcomm.com,m:romain.gantois@bootlin.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:mripard@kernel.org,m:christophe.roullier@foss.st.com,m:brgl@kernel.org,m:rrendec@redhat.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:dfustini@tenstorrent.com,m:linux-sunxi@lists.linu
 x.dev,m:linux-amlogic@lists.infradead.org,m:linux-mips@vger.kernel.org,m:imx@lists.linux.dev,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:sophgo@lists.linux.dev,m:linux-riscv@lists.infradead.org,m:bartosz.golaszewski@linaro.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:jernejskrabec@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: B5F437114B1

Extend the driver to support a new model - sa8255p. Unlike the previously
supported variants, this one's power management is done in the firmware
over SCMI. This is modeled in linux using power domains so add a new
emac data variant and a separate setup callback.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index f379570f80680e96f027873cda6a6bca398e22dc..47175670a32631369a2cf8b00388d9359513e090 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -108,6 +108,7 @@ struct qcom_ethqos {
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	phy_interface_t phy_mode;
+	struct dev_pm_domain_list *pds;
 	const struct ethqos_emac_driver_data *data;
 };
 
@@ -206,6 +207,8 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 
 static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 			     struct plat_stmmacenet_data *plat_dat);
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
@@ -310,6 +313,29 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 	.setup = ethqos_hlos_setup,
 };
 
+static const struct ethqos_emac_driver_data emac_v4_0_0_scmi_data = {
+	.has_emac_ge_3 = true,
+	.needs_sgmii_loopback = true,
+	.dma_addr_width = 36,
+	.dwmac4_addrs = {
+		.dma_chan = 0x00008100,
+		.dma_chan_offset = 0x1000,
+		.mtl_chan = 0x00008000,
+		.mtl_chan_offset = 0x1000,
+		.mtl_ets_ctrl = 0x00008010,
+		.mtl_ets_ctrl_offset = 0x1000,
+		.mtl_txq_weight = 0x00008018,
+		.mtl_txq_weight_offset = 0x1000,
+		.mtl_send_slp_cred = 0x0000801c,
+		.mtl_send_slp_cred_offset = 0x1000,
+		.mtl_high_cred = 0x00008020,
+		.mtl_high_cred_offset = 0x1000,
+		.mtl_low_cred = 0x00008024,
+		.mtl_low_cred_offset = 0x1000,
+	},
+	.setup = ethqos_scmi_setup,
+};
+
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
@@ -749,6 +775,62 @@ static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
 	return 0;
 }
 
+static const char *const ethqos_scmi_pd_names[] = { "core", "mdio" };
+
+static int ethqos_scmi_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	const struct dev_pm_domain_attach_data pd_data = {
+		.pd_names	= ethqos_scmi_pd_names,
+		.num_pd_names	= ARRAY_SIZE(ethqos_scmi_pd_names),
+		.pd_flags	= PD_FLAG_DEV_LINK_ON,
+	};
+
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &ethqos->pds);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to attach power domains\n");
+
+	/*
+	 * The SerDes lane, its clocks and the MAC AXI/AHB clocks are owned by
+	 * firmware and brought up through the SCMI power domains above. The
+	 * MAC wrapper itself, however is in the kernel's register space: the
+	 * mux that feeds the SerDes recovered RX clock into the MAC's clk_rx_i
+	 * is not configured by firmware. Without it, clk_rx_i never toggles
+	 * and the DMA SW-reset polled in dwmac4_dma_reset() never completes.
+	 *
+	 * Map the wrapper and program the same loopback/functional clock bits
+	 * the non-firmware platforms rely on (see ethqos_clks_config) so the
+	 * RX clock is present by the time the DMA engine is reset.
+	 */
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	/*
+	 * Run on every runtime resume, which stmmac performs after the power
+	 * domains are on but before serdes_powerup() and the DMA reset, so the
+	 * wrapper is always configured ahead of the reset.
+	 */
+	plat_dat->clks_config = ethqos_clks_config;
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -836,6 +918,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 
 static const struct of_device_id qcom_ethqos_match[] = {
 	{ .compatible = "qcom,qcs404-ethqos", .data = &emac_v2_3_0_data},
+	{ .compatible = "qcom,sa8255p-ethqos", .data = &emac_v4_0_0_scmi_data},
 	{ .compatible = "qcom,sa8775p-ethqos", .data = &emac_v4_0_0_data},
 	{ .compatible = "qcom,sc8280xp-ethqos", .data = &emac_v3_0_0_data},
 	{ .compatible = "qcom,sm8150-ethqos", .data = &emac_v2_1_0_data},

-- 
2.47.3


