Return-Path: <linux-renesas-soc+bounces-29134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJerOswpsGn/ggIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:25:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50726251E02
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 15:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EE5133C07F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 13:36:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136A338AC8C;
	Tue, 10 Mar 2026 13:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6oY9xeF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE873374752
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149535; cv=none; b=KzTrsCw8Zkt5IKLhwiVuKrotAFf6iHTB8Xf8CVb6x0z7l0nohuW6jfjVXltvMe8ZP3Cn8Y521Iad3lI5KqQdK6YVOerR300rzgeL+FSJyvpQ5PYoq61MS8tDhDuezaF4Mlyvb6giGyCr6VUKfAl+Ijyv4NvYcDeb5bwtdREk+Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149535; c=relaxed/simple;
	bh=JZnB1Im94T2fdND96sAVNsxHwb6+Zefxec2EDteNkcE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uQoAaed8ycLzN0ouraIEZ+nJqIIARdXa/pJTLLvsEUuWCGf/0djpf+6gt77A90q8hjSnXEz+HVFzu/jO4bP0SvT2/JQJHktSPHyRWpLr6dZ7B85dwu17TbpWp1lzPbh2fDHBc6vgv2q9AV5EivBRn8ZhkMnD54XIqcibFFlFjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6oY9xeF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-485409ab264so10668385e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 06:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773149532; x=1773754332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvqV6dapH2OVx1j1j7Q1WNL2fvhvQyWnQIfWQtbA8EY=;
        b=t6oY9xeFgVXgudMAH7wXBo8D1NQbQ/Ffu2xaWnYlC+azy5pr+qXirLUYnHjaV5RQuj
         JvsVPJTmdGJFIHbPKFQbMGRLrJf028hqnz2fRrB+8jJ30kxxMOZhpvhKAtJptsdIqfQ9
         d+qqj1XMuzYo22hqGiLo0micgLWfWsAByglqPENoJMWalh1xl9r03CXfZOMQMP+vJfe4
         EWa3Y6BA6SInFiOC7ywrHwNWe867dQ5ItY6pBX7frx7YWGyYo7iKSCzRFjkW4BrXfgTs
         7rUghhbjAKCgPZVu//Uo8iPJz3OK7Aag9GMNJ2l+h0rKbuOQ6skOJc6aW3nldme/eN5z
         OSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149532; x=1773754332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvqV6dapH2OVx1j1j7Q1WNL2fvhvQyWnQIfWQtbA8EY=;
        b=nTFIb+roUHcxL3BQxquu4VyqWBRUNggLouJLkPhRrTtOeSzYv0y7KUhk7bvPR7FFQ1
         7e2L2HwUagbeEDowaI6//kwLUHze/kArjpDBIKaQEATLm17vD2uengpVO8xqPi7YGX/x
         X+M+RP/rQHiKSuJ7nu/c40cB1WAALBU6XUV92PFUD9aH5ImtehXgOUc+cjFuJqYH41h2
         oKn6pPwzN+I6p857tN+As1NM/skPdYHR6EZPJGuFr6MBDxTOuPvq+aLYQdNrf+1ErGTR
         z7ck40xl9rfKwUDRj/rnPhKiKxwbWILvc/F1FyL7X7yQwEFDkjkGLWDUPyvQEUfi+la6
         Va7g==
X-Forwarded-Encrypted: i=1; AJvYcCXZu2kA1RA/DBXyPkYXcEDBpEUFXPtWgwMSaTw4az+LmeJx8Hj0wS7Ee6QYsmn1NKOCsEiYQF95ChFWaR780jESbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsoIIE1GpJWSNrEXqyA+H8bLyF1jusvxlUtaMmyYOyOCaxKCoJ
	5WNDKxyrQu+q12cwNsBEnvX0tW/wJvBXfm5jbS2Wtw7BlfcvDLMSUNW3OLnO3fygtm0=
X-Gm-Gg: ATEYQzyHrfr9LjSkV86pGi9cWTwGjtNqpNOwz/61vVJPxVp183d6WmWqJ71o2hXWJyG
	F1g7nM6ZREo0EyDBC6uCjWwBlbokLgUsDh+yOl3Mkw/aZP/SGPIiwu86y6Z63cJJ2TEuBfkrx46
	UgUPrIAMn8jLyZUGbKHi4A+Dnwa8fs7n1lMJ561sBsxfIwiXKh2wfpyfYuwhiGZV3rOYMZ6Rekw
	PkJfOTMHgSS1pW6o1Dd464g8lBp9CqZKmM3qq+uWKV7gXzN28uz5ziZuM+eD7WrBhUCrXXe3cfM
	0GbUk8T/naAV0iQdncldAof3dN2H+OdXzqGMltswNs3WFUa6swy9wdHWq6U5O1kSjcW4brecQQy
	XGyyMBfVCKYCCPfe4JfkIpVbUyAY+oKveAp/mNHLScBu0rZh6y68wE6DiMXIqPlXF+e7SBeR/d7
	8NjP+W+s/8BWGdnLgBgooh7IGi0g5UFtGHUPzidPA+/1xBsrsrGXE+IxKB+oIxcrmMJqm1rnpul
	RXF
X-Received: by 2002:a05:600c:1d89:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-485419a2774mr51690425e9.2.1773149531651;
        Tue, 10 Mar 2026 06:32:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:4d81:e92:c4c0:3c45? ([2a01:e0a:106d:1080:4d81:e92:c4c0:3c45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48529f019a4sm110277825e9.12.2026.03.10.06.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:32:11 -0700 (PDT)
Message-ID: <95ac5123-32d7-4e87-825d-5ebb424e2641@linaro.org>
Date: Tue, 10 Mar 2026 14:32:10 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] dt-bindings: display: panel: Few cleanups and fixes
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Artur Weber <aweber.kernel@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Dzmitry Sankouski
 <dsankouski@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
 <177314934075.2052605.970030122356003827.b4-ty@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <177314934075.2052605.970030122356003827.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 50726251E02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29134-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On 3/10/26 14:29, Neil Armstrong wrote:
> Hi,
> 
> On Fri, 06 Mar 2026 13:02:53 +0100, Krzysztof Kozlowski wrote:
>> I would expect this going via display, but that does not happen often,
>> so Rob's tree?
>>
>> BR,
>> Krzysztof
>>
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> 
> [1/5] dt-bindings: display: samsung,s6d7aa0: Document port
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1f5a1ebddc170197348d203b11a05799966dbef6
> [2/5] dt-bindings: display: innolux,p097pfg: Document ports
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/32003681e575a9a02cb6814e99157dfab0b9f70d
> [3/5] dt-bindings: display: panel: Drop redundant properties
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/72cfe73347fac6252ab77d8dcd405f0a5b1a5a24
> [4/5] dt-bindings: display: panel: Align style of additionalProperties
>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66b0baaabd35d302698d0a2c98671bf4e1b87f92
> [5/5] dt-bindings: display: panel: Align style of "true" properties
>        (no commit info)

Last one did not apply anymore, could you rebase it on drm-misc-next ?

Thanks,
Neil

> 


