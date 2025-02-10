Return-Path: <linux-renesas-soc+bounces-12991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D46FA2ED8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 14:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9226A1889BFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 13:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1441022E01E;
	Mon, 10 Feb 2025 13:21:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3972122539C;
	Mon, 10 Feb 2025 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739193683; cv=none; b=ZK/p6uFaJoNIl1aTK8y8leMc79cyB5Cb7J28S1rNz+uoLVLONAFzWc71wBtloSdUFN3NoZ+dcSFe+T1ePbAuqope0ZQO0625jz9c5tQ9HO3Dpkv5WLvRQFn1b8A3zjr+DhoStXekN7xrzSA7OqQ9oV4NTJ5DZCCrHFLZ+cxH/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739193683; c=relaxed/simple;
	bh=ohkkgGTG4JF6ToAOEObWn6G3QV4+Sz3wakpWczA4erY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EuP8GGWAInxVnZiN2nVMFyLpIShRjpCB36ewsU12C+Nv1WRLsQo1aAw2+wQDgLiEFJZdBYqfXn6TzaCNvpwD7AbSbFgSli4Y5LjxcfMevxfLY42yTnXVZ1nE8gQf8xmIRpQRrwLi63v+aftDU7DQlwt6ehFS5YDeIiAp6swD4ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5203d852d68so205172e0c.3;
        Mon, 10 Feb 2025 05:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739193678; x=1739798478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHGhOyAGanlUaS2JnMpIwfheVhKHrjDiwSH6kU5CdaY=;
        b=InNq5qKlIfut+B4dIVtFbD9cxImuSm6meEkPO/pCn4v8208J027L9POlCX9DLbNI32
         c1WULf/FZg1YYMXrRvFfXRS30uOrVgo2DhMkx51QUni/qANGrrjFdNlYVgUUTc5mHuYT
         +ZVdkJxWMRe2eSwWgjsUkYnmXXH92Jucjf3zH/IFuhyiviQIA96t2q2OxUwoIPTFK/vb
         ZMvMOVXD79yCodnNgm+avE1V8RFI47t+LXNXvSeJDeAxH5OpGFIlXYAVRG90nYoQrQS6
         52kAh2iENXirT/HbwZlPHMuymtTARnvCVtyRRsLjNjhRKcGk5n23w+tqWBx8rdqzN++V
         n8jA==
X-Forwarded-Encrypted: i=1; AJvYcCUSN71M+m0UuAEfBDfy3norY9DjnEvT/c3b27QtuEqPqcv/4+CUa6iA4zA/nne3aBH0t7wEgwIvKm65@vger.kernel.org, AJvYcCVNkfn976OhLi7AXlRXkersbpGzftjh2xSBaOJoA+0C9w168G3XrzB6WB7frr7hZYMVL/7SjNruChobCECz/x6T3s4=@vger.kernel.org, AJvYcCWelcMDdfD/dOon1nAoozR4Xp3nlkEBdOvi9GW6Fr0bEntgo9EEGobpfT0wKCXwEdGF1JC5ZlX7/jQkvocY@vger.kernel.org
X-Gm-Message-State: AOJu0YwWuyGZGp9YzR9xsz9STQ84iqcM4bEPpl79gEGeOKJzZ5yvoJeI
	CdnleC7ciC7YCwNKrMKoViPenwGB/Ju5lgI6qX0BHfV5mYcspBbKslMlmb3f
X-Gm-Gg: ASbGncuJNomGseZqp1W84BKMz3RIjLUrpU3fOlwp+JWO6fplj/1OQmwoe6yLIAFKmX0
	VaDil/qS0c6XpTeg/8C02tbrZHF2wLdnQO6RRAMXRmtzWYk3AhuNNs+DnMmAILGn8vwbxUTHBMM
	Mvs45N6u59f7kpYuCxMynMQbgrGwGjZUMv4h46oUhbregPcpb8xjuW5abFHKPMlKGUvJPIVJLNI
	6EIX/fIU+UOhKaK3mm+r43O6qHCS8UVlOTc3O8t57yi5H/N3GZAexTsT7BZHEVDdvcUb90Y8alt
	61a6rzxxUjoFVLOHOfnp9KyeNZLqnV6pAhnTcD1nOf8uz4pI7lD2bQ==
X-Google-Smtp-Source: AGHT+IHVdwttEpZCuNw6WSzSpJRnBTPNqVjFPyPj6XaCHif2FcpY6C6V1XoIaZtpxJ+Yl6if9VkKbw==
X-Received: by 2002:a05:6122:2528:b0:517:4e40:6838 with SMTP id 71dfb90a1353d-51f2e252893mr9281960e0c.6.1739193678219;
        Mon, 10 Feb 2025 05:21:18 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866f97d7902sm1627737241.27.2025.02.10.05.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 05:21:17 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-866f84385b4so1345556241.3;
        Mon, 10 Feb 2025 05:21:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWrSvl47TPAQE80LSLyKurk7lNRKQNSmiN+lXoO/eAqiD32TdBVc7lZZKoHyDqpBho0oDku4CAJChxR7Fx/ZMhjeRU=@vger.kernel.org, AJvYcCXQJiG2u5gtS48X4QazBYFient8ibuyAqI1VxyUXIxcFLNLf5RtxGU5a6ukvZuMKYn8TO/uah+5SdTxkPso@vger.kernel.org, AJvYcCXtuWoLYw47u6rdMDnDseF4SQsBCzgz27kqtxewl2SLbQGcOa6PDDG3upt/raT2U44SfMp5qPfAbhul@vger.kernel.org
X-Received: by 2002:a05:6122:2528:b0:517:4e40:6838 with SMTP id
 71dfb90a1353d-51f2e252893mr9281897e0c.6.1739193677200; Mon, 10 Feb 2025
 05:21:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-4-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 14:21:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLdLiyQUuO-Xox5zQ9waTqWYk474yYL4qqfyfkvxFs6Q@mail.gmail.com>
X-Gm-Features: AWEUYZlFKstD4BLVvqWXfkoH1N2BT6tmZi6nxuQO1z6GWEkW07mrq_NPLX2epyQ
Message-ID: <CAMuHMdWLdLiyQUuO-Xox5zQ9waTqWYk474yYL4qqfyfkvxFs6Q@mail.gmail.com>
Subject: Re: [PATCH 03/14] dt-bindings: soc: Document the Renesas RZ/T2H
 Evaluation board for the R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for your patch!

On Wed, 29 Jan 2025 at 17:52, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the RZ/T2H Evaluation board (r9a9g077m44-dev) in documentation.

This is the Evaluation Board Kit for RZ/T2H, "RZ/T2H-EVKIT" aka "rzt2hevb"?

> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

> --- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> +++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
> @@ -537,6 +537,8 @@ properties:
>
>        - description: RZ/T2H (R9A09G077)
>          items:
> +          - enum:
> +            - renesas,r9a9g077m44-dev # RZ/T2H Evaluation Board

Perhaps "renesas,rzt2hevb" or "renesas,rzt2h-evb"?

>            - enum:
>              - renesas,r9a09g077 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52
>              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

