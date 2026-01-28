Return-Path: <linux-renesas-soc+bounces-27509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAcdMcDyeWnT1AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:28:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDFA05E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 12:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 518FD3073DC3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jan 2026 11:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2977C2BEC2E;
	Wed, 28 Jan 2026 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSBO5EHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za3fglJs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460E338599
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769599500; cv=none; b=lZPZXEQ5j0T+9Fg+PSf1R5C6EFytGnZQxiKQQnNppoV8gdaA9g4LxthXV6zjREanU1QBPLtKmsXPy3kvni7uMnYgc45zTHYZ1HliuY+EQRPBBhj7PTx9ERkeJRIxgaWGNjpdKyDBda1UGjuSo4PmL2+9sILlWCrF/qMREq9rWlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769599500; c=relaxed/simple;
	bh=dVaaZ/ts/oUQNOwdJUlK/CE2cyjwYip+mrbrgffsmDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4qwd7MSAkzZlqz/VIPn+0Tw4hqogitlnWxOgN4oC0Hm7Ch1qneRo9P63we9x6ynPM2uIazrufvi9KVhA+JRvY+d5aEG6GqlktCSiFaEmzmXci20zpI+uC38tVa6ez5H3knRvI/Den/B53J02KpyI+cKkDB3yKDOOTkGCDZ594Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSBO5EHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Za3fglJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S924A31406340
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=; b=eSBO5EHkrk1kKvol
	or1hol6Sg/aspr2AtDwhhY13UR1eIqD9bG3gYLci7B0wSHjWtftBFSGdsPtlBcS0
	gmfF/12HMueS+9JgpEynVntlJQAX3IZHmC53Aw62zLMDKnaEOnZ5sOrLi1eHtUyH
	Ykvt1VM16nyeOAutu3YgEv8lwDvluq2erwKlrDXCusZtEpLw37JoP3mc/2JX5+9p
	urgyjMvOKOHg4uhwcNbnSSajZOeeZu7KmpeWa0lSs7nz3B+icVeL/OM02E68eTo5
	p6Qs6gzBK5OXPo3155SKE3LEKWsu7WxvCuzhwDXeCwO2tQzofTi0SOyubeXWeJYV
	fVl0Mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4dytjsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 11:24:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5029a8193c0so3355561cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jan 2026 03:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769599497; x=1770204297; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
        b=Za3fglJsnNFRQ7a9wwKI1JoJvIB0xrC9PE1O6btR01k9ewhn3pQsM6JNuG5yFYBwxs
         4GkqhoBxCHsjCwYjFebPAZxbUDofYT74n1CCeNJ54OS02skyBZI/XHDxnD/yDpqbg6BD
         pHp+OiNapQs91XX+ltq4mlMtA8Plfg6QmvYIfTSogUWXTApFEmAvASdATJu+1PINJUd4
         Juq9S5NDAIacHWq6A4IpAaz49aweNNvq8Xds1wF1tbLPH9R5XxWzKWEoDf4T/zdyThT4
         Ba1IzXQdF7t/fbtH89fiVytb+LGvrw2hnDwgj9hdBBEaEBs9gr3vCLigcUk0eFaxLnDz
         RDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769599497; x=1770204297;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhRsJ3EzuUj/2l9fOKYhc3V/t6syCqgQiffXBGPgzVU=;
        b=Mbx2UlSgJ4ArC4XX1dt1yKCGYHJ5Dz6ObnLVaB7g4MFQPHK7CDC75YKuplp0UOwFjq
         +3NH/FEaXJcJ/L5zPmLCWVQ50VWtk46qWJr4gb335bDTswaqNdUAYqK2BiTTPzMN+8oS
         Rla60pNb7UfRP87AQQJjVCk3KEEBeiE9AS+XM91H7GfQFeMb8dyKEO6qKCqsV7fCPjWm
         aNeXmB4Dbeptw1bqTSoY43jHMfTrV/wxDIQKQwRM1oaa4n0fv26pqHN4NQbzy3ZzkWwz
         gWHUbUebHOHnlDqSui4FPq73sQoBWBchkQ1nos1VDf9hlqQlPMiPwyHM3YhHCkWHrAYL
         8F4A==
X-Forwarded-Encrypted: i=1; AJvYcCWdb42QVrudfvBylg0MVXQU/n9ja28LwL9XkYBiTlI5MNaArhmVyZQGmuNo5sxNUbQ7puDwKSKDfVTs5OsK4fvNhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXYaH1qaGi25rOkh8G8wmNH7uRNA3HpSinLRDzUlN1x78SaTTW
	ZVS71jr21zJob6SBf1sL6ktTam9dEXUw3nsC9bAoLSacmu7sD5O+GaoqZYR4cEQgnUhzMVQtaF4
	nt964L1I09fjdWFqOz/fK56R0xfebh89lA7ylvyWQj6Zp2x9BT7t3SPOAXQdyP/uVr5Bf26iB9g
	==
X-Gm-Gg: AZuq6aJBSSWfkMNvWucWL8BYI3jMLbZTViqcnT7SkXHfbRbheszzWJCBkhQeoztHJhm
	GwJc/AdXTjenfeEmvV/4RWqvBvsDrmc/8ywcX2hJ3ZGIjZHhPi2NYjiRcweYGCKDu4vkJOYM0X8
	hI4v3iyTBA46cYRtBPzNwaBFsxp3Y2D07T62oOKoE4Xmp2AwuMDJ1NOjUsQigr65dCxcmSeE7jI
	ee1PF2/JkinSiBhfnM6EVqwfdHoxWFtYlvf3XpKsERaVzGQ6txtOXVcDcuI37NGG2qWSA0QXHc1
	P+21IdfGlMglNQhTXvSamTxcCUwmI4USJpivB0r76STp4JOD/cLF26hWHwfHNKn8deOr2c8aTUJ
	IwaePk2K6Syr39hdJz4sag6RpRSux2ZaF4R4jr888inUP8eg9qyLgEnpVooD22wEwad8=
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr122193785a.0.1769599496971;
        Wed, 28 Jan 2026 03:24:56 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8c6:d3a7:3d1e with SMTP id af79cd13be357-8c714a67607mr122190085a.0.1769599496363;
        Wed, 28 Jan 2026 03:24:56 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1847f9sm117534166b.42.2026.01.28.03.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:24:55 -0800 (PST)
Message-ID: <de10c91b-f6bf-4594-8df2-71395ecaa893@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:24:51 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-7-c55ec1b5d8bf@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XqT3+FF9 c=1 sm=1 tr=0 ts=6979f209 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rO7Yge3HHgQ4wEOnkrQA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: onp4gYBgocYDVLCl-k57D1FwG7JAfk9k
X-Proofpoint-ORIG-GUID: onp4gYBgocYDVLCl-k57D1FwG7JAfk9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5MyBTYWx0ZWRfX5sObAgwAwlCE
 hV/+6+06Pw04dhOO6bM2i/TXxFTMmve8Xs1sRZr6OwmG8rOIA538ebiq0jNysOwtexIlinWHtpq
 ScDzUVgjP/Exn+A1+Bkr/dVTlyDrArGyJS4dATfaLtAbirr/FTWTvJT3GgSfWeeDDCkX6kAZrD/
 PGhFuDNBZJJZheC1E944I3eGv2GScGxN35YdtPJ22vsOraohotYdNRgrwrG81WVSG6Pp7d6nAY5
 S0FZ9JbuEH4Hqvgwi9Cd5yemabu3szlAECTLLv8rONS3DvHcDexC9GBYhdInZlgC+ZZywoQq07n
 GvU5GDk0NIerxch1UOVUVrBu37AStR2Hp4xkMbt52LWjYdFzozHRacWtDDUJKbC5lIQ1PBSF71C
 CW7I2lW0aBeWe05kPmERF01WoEPdQMdcMyio/DFo+iQtbfX1j+wXHRifRDYPg6xMzZG3fYJTMFm
 sK7TjOYdfEveEwri62A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27509-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,outlook.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4BDFA05E2
X-Rspamd-Action: no action

On 1/27/26 10:57 AM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone without the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display panel support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

[...]

> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			codec {
> +				sound-dai = <&lpass_vamacro 0>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dp-dai-link {

'd'p-dai-link < 'v'a-dai-link

[...]

> +&pm8550_gpios {
> +	volume_up_n: volume-up-n-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-pull-up;
> +		input-enable;
> +		power-source = <1>;
> +	};
> +
> +	pwm_fan_ctrl_active: pwm-fan-ctrl-active-state {
> +		pins = "gpio9";
> +		function = "func1";
> +		output-low;
> +		bias-disable;
> +		power-source = <0>;
> +		qcom,drive-strength = <3>; /* PMIC_GPIO_STRENGTH_LOW */

This is defined in include/dt-bindings/pinctrl/qcom,pmic-gpio.h,
you can just use it

[...]

> +	upd720201_avdd33: upd720201-avdd33-state {
> +		pins = "gpio123";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You should be able to drop all the output-low/high properties
since the device driver that references these GPIOs already asserts
that

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

