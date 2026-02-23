Return-Path: <linux-renesas-soc+bounces-28412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBkSDbGPnGnRJQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:34:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2417AE2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 18:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BE6A302AD36
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 17:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6712331A4B;
	Mon, 23 Feb 2026 17:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YYjvRE4H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C833122A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771867857; cv=none; b=rYG9y0yOzUqtZW1YAyrsKTpy425J46dwMiynDPPt2aLsXPz+z7oV6i0P37lDc8FIO1gAHeytGMEKQTbg4CcfzDgRdhNs2bdhTnwvcVvFc2vePPyUn5mx6kLNOxu4BIvGlyrju3DCbBs56TlH8nRokXtQyh1l39GxpleIJm0C/L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771867857; c=relaxed/simple;
	bh=Qzxxfb7kEku2747lmzT1fwRiAYJSGvUIx6A0aGIdbAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6vQtHFF+flEYI+ymIDEwhac5MYGWfluhxCEenpiim2U3ecwmN1nsArcp5GtKpWVA65yYYd9Iud5a3WPWx+kcwS4ScXTD09KEv1GXgK6yUB2rj/YY9X9u+NTwI8T6BBUmBAMbOHLgnzwvjFO/Axtt8IlR30ZG9vFZ+mzxoQe/xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YYjvRE4H; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2aaecf9c325so28702455ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867856; x=1772472656;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=M4zwELJsKrnUn3XMEc8EvKm0F5ghfXXoIZYyz+7tNzpymQS3YVc2n02bE0iQUwapMh
         IkZSbAnOiNn1uGBPamVVpyoq6ReafimBi5SEL2+h+3l54+2IellIq9VkcCxNKa3ZTgv5
         fSc5dUB7lHqjqNlzsOUaRA+YIuHVtD8Dmx/fHzX96/jJ4HVATBMx9H1fVHjZq8AyNJG4
         U1FZ9wuLZNHIXIfRhMJ8jT9iUdF5yhiN7XfUDJwpmkKNnA7N1kR7A1k8yNNNQ/bxy3IO
         epzNzlU6BeXfs5oRX6c125jTsXzbUzQMu6vYlbMeQxRGlvD/LzNe8VZvEvyvGyY/0/ed
         DtNw==
X-Forwarded-Encrypted: i=1; AJvYcCUQ/Z1DF+Yi3NfzPDZw9rGYzdt5IwnffG9/wdiwCLhLQ9NufHJqaIIHymcCGQbG6XXi44hy1iysbxz4n9Hf1FWLtA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSRbzUTxPvBpNgXppyxOZOO9jx9HWqrqZONOdM1MbWkiOCb8o0
	+S60F1iVoQr8WFCWdIClH06F7zixvco64EWJ1ZYTGlRnOt1DRK8ce2pr3O0dnF6yIzjMQNbeOlV
	ZD46s3frkJXvgEzBb3YXMljq3JgUeCQBNJzJfjHH68Pa2ptNgzJnJmuHZyVH549hJlALrN3//dF
	gkn3+D0xlb2ItKFiqMbfHAafmFhXX/p9De5bq8heUsDLmEJvSVVELMM5uouwnAvLkHCWIMVaa2i
	mLoC4XHo5+WyNKP58BuzaJTEAo3Xnc=
X-Gm-Gg: ATEYQzw/0sKTyeHZDkoZdNq4SlwGDjrSFM//BWvhP9AMb3Q+Pl+jRpSjWkq5LsQqTJF
	pNmi887bPlB6TxKxY9khqWJs6FDXKxKp9K5BovzocffSyWUTUuQFCCZjGNHjoGAUmVa6Th5jig8
	ZlYswYlFEji91XtjMaKle2LCU1/EFBc8Al4K8cQlSv/fr/S2Xxjo6n/7SEcGl4ZpiGNGdkLdbXb
	AnyWGfGrZOwsaL4VbitfXij3Sk7xbwLCU8oehgwLj0j3o/hFsGTqpYs6UOyJC3pasuVz23f+Uv5
	BLBMb6jK7XgrlJOd8mzur36y4YezQfVAbv0J9dNBaOAKyhRByloRrLhjvLgQzJqYeFV3zPIL2Fi
	dSsmydb7Pkh/DMDx8P73z9KkeHVuAO/0uui+f3g4Dsra62hAA/4YCsu4wQ5XStNCVyhoxavwtwR
	igWxLyjA+zV7VJy4cw/KYpMU3oQk+9o1ApyKO1NufnOlkuDtzx+5RocgzIEKlqAA==
X-Received: by 2002:a17:902:da47:b0:2a0:f0e5:74eb with SMTP id d9443c01a7336-2ad7430c761mr71419815ad.28.1771867855947;
        Mon, 23 Feb 2026 09:30:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ad93259567sm104575ad.0.2026.02.23.09.30.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:30:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12734af2ca4so3938411c88.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1771867854; x=1772472654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y8V8psmXfo8hyIGZcjW58KCT42psor/P8r1YSImT3V8=;
        b=YYjvRE4HruAu5OzT7QZgqGW7g70xXAhKcDsBNonHu2yW0hARBd8aBGgcAEuairOtRX
         NRSCf9n0jFz6aPCuDkXlrWTLY8R6a7zt5D/OueQbP5AFFsbUTm/Gxl6l1ZMFhr42tiVE
         8kXPbEOKedaAjG4vVc3XX+RafSvKOijAw4ssM=
X-Forwarded-Encrypted: i=1; AJvYcCUsRjpKmAim7HTq/PTbddvc2NnCOUQrXyCZapDWmbxYRcaljiAWclVzgvkR7VLEmmrNPTtSwu4SyrI0i8PCVk3v3w==@vger.kernel.org
X-Received: by 2002:a05:7022:6b98:b0:122:154:7826 with SMTP id a92af1059eb24-1276ab5845dmr3541884c88.3.1771867853483;
        Mon, 23 Feb 2026 09:30:53 -0800 (PST)
X-Received: by 2002:a05:7022:6b98:b0:122:154:7826 with SMTP id a92af1059eb24-1276ab5845dmr3541858c88.3.1771867852486;
        Mon, 23 Feb 2026 09:30:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167d3sm5627944eec.24.2026.02.23.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 09:30:51 -0800 (PST)
Message-ID: <73a783ed-ac77-4d4e-b1f8-6114c33ac33e@broadcom.com>
Date: Mon, 23 Feb 2026 09:30:48 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/12] i2c: bcm-kona: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>,
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
 linux-rpi-kernel@lists.infradead.org
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
 <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260223-i2c-adap-dev-config-v2-3-d78db0a6fcf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28412-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,broadcom.com:mid,broadcom.com:dkim,broadcom.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,sang-engineering.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[broadcom.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 88B2417AE2B
X-Rspamd-Action: no action

On 2/23/26 01:05, Bartosz Golaszewski wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

