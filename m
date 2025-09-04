Return-Path: <linux-renesas-soc+bounces-21386-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD04B4473F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F3E01C251A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18FBD27FB27;
	Thu,  4 Sep 2025 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIx24vXp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075AC27F75F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 20:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017417; cv=none; b=aW2nM+EpS6Fk0UZGlhtsmELBq+r08CHQ/xdKq/4mDU+N7iPFuiORe0qowgs7NQ3ji5RIBRfMoKwgzqdWYK/QLmrwX021WDDy96IW2tmuJGCRq+0P9WWyDKRVCEG8lHDF0Wdbogvy6jeCx+Yl0oi4LEIqQFI5cG9jOFUBizm7ecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017417; c=relaxed/simple;
	bh=fsPCQdEgPyW/M1G1rLSRaepVZ9EwJ41Mpa+/hxxZWWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kzJJxozA3ngtKNRt1MisCQpH5e5+XhhIKQ1YHxtQf1r3LJ4cXIyeEiEndSVXtlz4otF17Ki40nTHyTHKPP0Ft+uaJh59kwq+j/JNN5zAydxTb12jVJN5n9/Jqk1PDhX9A2VezqcGzvt5K9XEaQoGR1FGlQDYV3ONxRhIUtHyUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIx24vXp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584Hk7mH013506
	for <linux-renesas-soc@vger.kernel.org>; Thu, 4 Sep 2025 20:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BhjhLn4p+fVTddeDOV5N535S
	l5j76d//X2bYh+lMLPs=; b=gIx24vXpFsSdYeFUk+FTmMF+B4fWHQdBzPmDn1LF
	SRJUli3nCxV50BpDCX1zqobOq32MoATgytI0qIMpMYtk2fVfWbJt86zys1vlIheb
	cViV+E2xviNdFDXLMdfK5WCGZvLlid0xsRG7K5iXiF5UFcVUm24gEW95xzMjDGRW
	4Dm/0Gh8RYXspRMoJL1mMXKXSc3otG7CWOmIjLz35eYjeNYSprPo1S2ybgR1Glcu
	xXNh275dxJHD5kI8+rxFACAbl1Mu6aV2Vw9A/WEm16IK2D6DI+HehFjC6Ki6etoS
	rPBFtMlReVhhyvGq1l9pAYY3qknNvEyGFz3E4pUS/uTblg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wycqyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 20:23:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7193fc78b47so23581736d6.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 13:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757017413; x=1757622213;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhjhLn4p+fVTddeDOV5N535Sl5j76d//X2bYh+lMLPs=;
        b=rkCs3IiFJtWZfjNVm6j6acerfIOR0EUXdC4o77sKfztmY/2n2yYfOUHt/+mMD/JGDv
         MMDS4KWZGIGIJwgrwIw/OoAqeT9MP+Wf3HR8EynpiPbts/QcAR14pj5yAOeW7YzRJ21y
         XmdzkVX21YqVzib4oqv5t+5kdYmHQUeOQVMNZuaf9FrQVy+iWRa22HRq4Uy+J1I9k0Yt
         jq6NmlPSWtIprFaTM1raA5sjUoEPvy+Vgsc986v0eQcfOmQZsdzvkLXrZaRyOoGjkVDe
         cpoO05JPChWagRiwenrFypvVVQiR43wgeV3glk/SOjjDm/JRqYhpN14VhvyeAMjQ4ehi
         J4qg==
X-Forwarded-Encrypted: i=1; AJvYcCWHI5vABFxYR9TxhMv+5gBZDxU54ywWPh8GCl+vNJYY+ctf6GujjorN+OWpO4p5fYTbd58c4xFDZrb70To2uVy3cA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0BxB0ZLnQnTdbhkHLsX0gZCD7TZtuNvZBtk3y2viw1suOuhu
	rPYy5K1IrPun+3j/kNV/Ct8v8zNuIK/mP5OaS19A/oMyLLuKZyQ3uLTdDQtxrG4khMp65UlnFhW
	0TORt5o1ujptIZOID9J4ZF+DnXbK46dzREPGyucgoY8adtosenfBKMoTV4OLKX/okrUy+nr1GcA
	==
X-Gm-Gg: ASbGncsCdX/WKMnTK05UGoeMUZSggjo5k4DH4UlUUa+IoNOjLes13nq9VDxA8qJcaxC
	0O1O57d2fJHc5tdvV2/9q7Xhl/b/TVUD3txe4rgVSNrkCd3APpeOIF3vZLyVc+8VDBGZ48Bt3nl
	3FzGGtcaEjbebedL0/RB8VvDaP3QZedqdFLLUTPTCHKiE898MLYz7IMH197Sf32Gf0cWh+gPPVp
	k6DU+VzmcrERvNoL9mJzCfj62Caaybe8A951ztVnHWGyExsDdcNz6nS57QBMj5esB8XCfdkdXTQ
	9QgQlqdqyQnkvQ+/aVALKDLlXDFU8YPtpwN9LEyQ9Ee1t9W/qtICMH76z7M1y740ypJDvMr/W2u
	IgZSkonG/yRA3k2UNrVnTz81WE8TtFg03V8XW2QTGod1IB7hVDe6F
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id 6a1803df08f44-70fac789c6amr237886116d6.21.1757017412579;
        Thu, 04 Sep 2025 13:23:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7DTtrjAmMG4+SbOuJLgcfs9oxMwNnEiEQAc0Pfy9/m+t6Z1n1hx4a3Nf6n68AGum0eX+41w==
X-Received: by 2002:a05:6214:40e:b0:709:6582:86d8 with SMTP id 6a1803df08f44-70fac789c6amr237885516d6.21.1757017411833;
        Thu, 04 Sep 2025 13:23:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5608ab5c0acsm1437638e87.16.2025.09.04.13.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 13:23:30 -0700 (PDT)
Date: Thu, 4 Sep 2025 23:23:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas, dsi-csi2-tx:
 Allow panel@ subnode
Message-ID: <lecx2cs5durkwq4at4w32bgak3s7tsxfmj6fzvyxhfjud4zljm@25aijm4rlhmg>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
 <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9f545 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=b3CbU_ItAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=P1BnusSwAAAA:8 a=KKAkSRfTAAAA:8 a=e5mUnYsNAAAA:8 a=HSFmO_Wm-5cOy6Hx3LcA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Rv2g8BkzVjQTVhhssdqe:22
 a=D0XLA9XvdZm18NrgonBM:22 a=cvBusfyB2V15izCimMoJ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: s_8riRd0gUDQ6qYKIPYLUxJgrAWWXRs8
X-Proofpoint-ORIG-GUID: s_8riRd0gUDQ6qYKIPYLUxJgrAWWXRs8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX7ZK/GWqJoKcU
 4ZkJWYvBox5o9+MFF0tl5S9TPXF/AV9okv4+GmAAcWQoLaKxGkftJ5hOKtp6cLYP0D7NU3GBzSc
 IiBJ6b+Rv20UCJs77vFCgQEezlywVqFq30jtBk2dFQuxgkB0mESG8zUAdIsBFsFvavdmcITpCoU
 tp4HsPyyNue1g7Nuib4hkhcuJpKHm5eTOlNwPebVGbT9XRGqLdGkN/OvtDzyf6GKobBNQ8OBuyb
 tkO+xSw+kt1RNPZOU/XVN06y4LXeKa8vzr/hnDr3H+48QS2jf0x9Mnofcj4hViF3iP7D4UPIWix
 iCcahU6W2fFM93KQK5pggp45Pw7m3eYAqfjs2xVu8inDVZUCU6UH4Gmf8SPqS5vfmWGzEoj25xq
 jsrcsW/Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_07,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On Thu, Sep 04, 2025 at 10:03:08PM +0200, Marek Vasut wrote:
> This controller can have both bridges and panels connected to it. In
> order to describe panels properly in DT, pull in dsi-controller.yaml
> and disallow only unevaluatedProperties, because the panel node is
> optional. Include example binding with panel.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> index c167795c63f64..f663bc6a6f831 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
> @@ -14,6 +14,9 @@ description: |
>    R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
>    to four data lanes.
>  
> +allOf:
> +  - $ref: /schemas/display/dsi-controller.yaml#
> +
>  properties:
>    compatible:
>      enum:
> @@ -80,14 +83,14 @@ required:
>    - resets
>    - ports
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
>      #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
>      #include <dt-bindings/power/r8a779a0-sysc.h>
>  
> -    dsi0: dsi-encoder@fed80000 {
> +    dsi0: dsi@fed80000 {

As you are touching this, you can drop the label too.

>          compatible = "renesas,r8a779a0-dsi-csi2-tx";
>          reg = <0xfed80000 0x10000>;
>          power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> @@ -117,4 +120,50 @@ examples:
>              };
>          };
>      };
> +
> +  - |
> +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a779g0-sysc.h>
> +
> +    dsi1: dsi@fed80000 {

No need for the label (dsi1:)

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        compatible = "renesas,r8a779g0-dsi-csi2-tx";
> +        reg = <0xfed80000 0x10000>;
> +        clocks = <&cpg CPG_MOD 415>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
> +                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
> +        clock-names = "fck", "dsi", "pll";
> +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +        resets = <&cpg 415>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +
> +                dsi0port1_out: endpoint {
> +                    remote-endpoint = <&panel_in>;
> +                    data-lanes = <1 2>;
> +                };
> +            };
> +        };
> +
> +        panel@0 {
> +            reg = <0>;
> +            compatible = "raspberrypi,dsi-7inch";
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&dsi0port1_out>;
> +                };
> +            };
> +        };
> +    };
>  ...
> -- 
> 2.50.1
> 

-- 
With best wishes
Dmitry

