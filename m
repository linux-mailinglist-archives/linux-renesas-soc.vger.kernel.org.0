Return-Path: <linux-renesas-soc+bounces-29321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OXY3Fp3Ps2ncbAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29321-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:49:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616627FF19
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 092C930920A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 08:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B96C381AF0;
	Fri, 13 Mar 2026 08:49:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6E366061
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391746; cv=none; b=atJBB1woPhiU/tks4kYeI+CWXdtllJLh/wZMsFYnOPMhqg2Kg/z5zzaoY4ArldDNDn3SsLXXi+yGpU3IZ6bShJUsHihTcZ47ruKCdjOIwkfk19aO3zNzJ9sT/Mpmr5X9MD9mJG/PlXDzOrOV1XdVUyxE8aBLR/1LpaltfLwCEdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391746; c=relaxed/simple;
	bh=Ua52PBrMRguUB1TFGkRs7ufN3Wn+UHTtA/Ozw/l0cQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbDt8fDq48gGwh/M8J7E2OQUPWHdf48hM1ikv3I5U4bxgM0C9h8OC62QfXh3uysNiyinT+LoZXFZach0Mui34Ra1fJd3YC7ooK0W17D+JCeUhz/8nZJz3LW095LzYnmIgpM5rk+lrGDqqVmZ4PkD+Q8WlubFCElxVODaqb7ruIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-509307e3854so27034541cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391741; x=1773996541;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aDo7j94ftgy77ygvSOcZoX2nYRGeP4vCbL31PwDsek=;
        b=hYIfesVvPxI+PDXyrtOMO+c5ubFjOHtmDdMjeq1vKh725gTr963Eun3KqmulYFkStT
         C1C1hsBrhbpui3puU4vonX3c8X7kawcvjVVXwrVIveqbHnDmq3MrJqp02zu3FZem5QbK
         skmuNPaChV+CC3TAVrE3ZiKeWFNgNE086a+XjiJ8cW3F+855ZlME1Pj9fIZVKqdAdWyX
         N4QYO1I1IXw2KXhHT/GqWZDGdqVl+ierGnxzFii5pWN4jTCRCD71vsn7+/w8BN84TWkx
         o+/OzojhVw6glqo5V6N24GiBlx5BUPbRNNHlh4/rDtaRatp9fwiwFHBpVefF2Ty0RPAY
         a4AA==
X-Forwarded-Encrypted: i=1; AJvYcCU5mph5kQoaTQMFRfPJKk6iixAMPMdW3JznEueWkdqyo1rhzcU7f/H0LyRLtooFfbt3CM1jDwo+v6aJlW2mTeK7Rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhsyHHAoQ8exRMdDYO2q5BV7tYpWxbwJMqWGOfAG11pNehr47R
	iDLJhfAj4Nk12UBIRTFp4wICUwTea7bfZTMbBXRU2ATMI4jJ2BAIyUUkCepF+pCEiGA=
X-Gm-Gg: ATEYQzxy24zTSyg8IVsCw1IRk/SJUjKISo0b6W59LeFc+OL/4c9E1SGsSL7w+P3nYfA
	he/lAUS7qngPLUHM+OmqGNQbpfl6AnPP+cKW+81cAoG75UOYNwcId18a1XTAOFjA5uYFjnEfLzc
	ni/IEcBOVg5eRpCICu58qzT8orKhgddXMqwCtotN0S+28xJyPA7Dp+wAAwrDC1YONRBVmc5of4Q
	UptoN5ewi7/cQYOshTQOAY5qCKsGe0G+OSQN6llrEif+ejHx6cgHVvcElnyEox959Y7ddS6ue7C
	3Wsgtqedk0j1zalKuz0v7KRJYtJBjH32LvqN7J9mrQNqTxQz99wkkfbsQ2VkCMZkTmP9Toxlj63
	VS8p00uWV5zrBMzUghxLiIO5m1WQHxAjGVODRBHtyZjkOsrYqMFqokJUOgqMLvY4te7ZWSLyece
	gCbIhl2Bwxzla5ZlFtTaKzvRLvUFI/rRaViFbVsRWXL9vr6E26E9MErGwrFMNL3FZ+
X-Received: by 2002:ac8:5805:0:b0:509:1dc8:e9e4 with SMTP id d75a77b69052e-50957279af7mr32680021cf.22.1773391741312;
        Fri, 13 Mar 2026 01:49:01 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com. [209.85.160.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50939ec56d0sm57017851cf.11.2026.03.13.01.49.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:49:01 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5091d71aa11so24950761cf.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVb0deX7zUpOQkrZvXqW9PARX+LgENjMwevt/wOV2VV7ZhMszy+87nMjRohJoUiNm+bibY18wAiDiAGyJazIpMAgQ==@vger.kernel.org
X-Received: by 2002:a05:6102:94d:b0:600:3b3e:681a with SMTP id
 ada2fe7eead31-601f49df949mr2684902137.14.1773391317301; Fri, 13 Mar 2026
 01:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309000319.74880-1-phucduc.bui@gmail.com> <20260309000319.74880-3-phucduc.bui@gmail.com>
In-Reply-To: <20260309000319.74880-3-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 09:41:46 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUqiaP=COTkKU_jK6Hdii+YJ5+zXnxFkOOnhLri5NakTw@mail.gmail.com>
X-Gm-Features: AaiRm50dDPHbKiQlKjcHuSZ939JQWLNa2vCYSRXIp8LSqUBGtQD6gyUdpS8tlkg
Message-ID: <CAMuHMdUqiaP=COTkKU_jK6Hdii+YJ5+zXnxFkOOnhLri5NakTw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm: dts: renesas: r8a7740-armadillo800eva: Add
 wakeup-source to st1232
To: phucduc.bui@gmail.com
Cc: krzk+dt@kernel.org, krzk@kernel.org, krzysztof.kozlowski@oss.qualcomm.com, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, 
	hechtb@gmail.com, javier.carrasco@wolfvision.net, jeff@labundy.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com, robh@kernel.org, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,vger.kernel.org,gmail.com,wolfvision.net,labundy.com,sang-engineering.com];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29321-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8616627FF19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 9 Mar 2026 at 01:04, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Add the wakeup-source property to the ST1232 touchscreen node
> in the device tree so that the touchscreen interrupt can wake
> the system from suspend when the panel is touched.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

