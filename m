Return-Path: <linux-renesas-soc+bounces-14080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C6A54CF7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F9603B0F7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 14:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91D9154430;
	Thu,  6 Mar 2025 14:05:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E48718C337;
	Thu,  6 Mar 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269906; cv=none; b=iUfEIuzYRp0z+JKR8MyP7zu1CfSLflvSf9sGopsWLPLg8s+DQ97h0t7uVklSQEa4GUS6kQ+D33JMl2i3YQX9zwcMtT2mcSDTzrO/n3DwhUUX8gJ2WsKvEv4d9MY5J/z87l5B/L8hzXtzNRKbeTSsDIqi2mKulZJAfKbT484cevg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269906; c=relaxed/simple;
	bh=Nk7WcGueiphMJ0fsWCxuYrZdcFJavYrEb4pNdBUzcZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aLmVATbvO6rR90nFPUrVOixegpvK3uK7ra0ceVg2/M7+x9rVVFRlmg4y3fwJA7PaMww1e99Hfdy7gk/IOpe+tWOH3Xd+Yk5M9Mb0vHXB5/q8TnIzrpQgrjI/fsBpmlKqdGvk3d8yc7uVcTzi9Avq/pie1laIBl07/+pie1wogxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4751bec4449so3267421cf.2;
        Thu, 06 Mar 2025 06:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269903; x=1741874703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvdtDEC9XOZ4SiNShBFndqkvatMXAPv3rT5wVsIIH7w=;
        b=SEacuXJDv1dEyFT2XYTVKHOSJqFhqQlrwAq9DZd3MKb9pMEYKKDwl6hz/W25aXv54f
         h6U55KXCQDl/aTZQnbR4Bw9J4icux6QtlxoalE9+X4kReVyGBQXgAlDyofRvQWYl3j2+
         f4PekiUwg/DJvorDIKOW8hEZog5EYc3ahAZFlsgQrpYmfr5oPx3uRPUPbRdi0piOzvfu
         KXafNTiGTREoCHXeXJG6VGLzT/aPDgGM0U30DVqvwDmFYiSrYfRSqHeB/dbvL2YB5IzH
         SX6ABO6s9/y6JQMTwLbka2R+Vvz226JRuJtA8J2n2HDobg4wzvk8tbFnVvZiy2ucGDi5
         aB3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJLEKsOittVlX8kbLo1qnOUiS2rfe1Ac51cSemTJnrMWBuCIy/S72kCSJDpZA9DdI8osBJQTQ9zGHl@vger.kernel.org, AJvYcCUeUUyUPEZ8Vt+8tHLI/AuiwUCJ3W45Zjy2OGP09TOtTV6CJBBsrrIOEqbwtN+uCMD6eLgdSpYt/GuodQY6@vger.kernel.org, AJvYcCWHdGbduv5KK4Rqmxlpx0JLnnualn0cUP07msgJwO92gz25PZ85wKEkrcVhcKu458gOGdVR84WJt4LPgaVjac+SebQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ilcnjbw2+KGlrW2NexHm7KZfV00gkTDTdqF/aB/P0eP7Go2x
	jvh9HZtu3Ep9cEhup90afiUyUEqEeGAHWA/ZoyCcvtGhOPWsk9Vcgd8XoAx9
X-Gm-Gg: ASbGncuEpLVGYSRfK2JnK3vkDM7ac/BgOqB6VN9E2Jj9fvI+2v86P2OWEmslUYu0PvM
	DN3fu970QSDorNQQWwBVgdsw5m86PRoFxKyBJz8u273o6m7/gNiE7zq7lGmJ0McmtSywSjUe/i6
	16YLN/fbf1+mw1W9nCICScbR9kzL/0mEiQjph4mXFUMO052Tkz92X8oJF72wZp+P68eB+JoUnlH
	q44NKPKFp9S4bz0vG0KmZ8lTp0JrXKIVJzC9crwViUkmM+OG7gFnJ8QFojUmfy4TndihRC/fqG5
	FwngmuvAcB6SnWd9zqASb18aTUnCKaDe8hkMF7ZDdogRzhSCol5KUlMXcgiV8RRH+66yVBymy9O
	HPw7yO7mVU54=
X-Google-Smtp-Source: AGHT+IF2FXnT9gsF1Uh+ASPCzX7IIsWPsTLKneJ01L5YU4onJHkF9PlOMt4NpEn5AJX9OAiZYsD8qA==
X-Received: by 2002:ad4:4ead:0:b0:6e8:fad6:7104 with SMTP id 6a1803df08f44-6e8fad67424mr14944606d6.35.1741269903107;
        Thu, 06 Mar 2025 06:05:03 -0800 (PST)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f707c5dcsm7450156d6.3.2025.03.06.06.05.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:05:02 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4751bec4449so3267061cf.2;
        Thu, 06 Mar 2025 06:05:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUKUKICBuIbnspBAMwyI1k5prF7JziVhnes55nFbBtmeDFVDXiiXCl3TfhGJtKSu/hnqTfBPAUc8blns+oplZY8cqg=@vger.kernel.org, AJvYcCW8ijbK0hz42CpBUP1ER5J0G1jcDfKNOlwIqLxbwQojCvNA10arQrvcZGlUxp8Jz67AJPqHuhZIcJn9uljX@vger.kernel.org, AJvYcCXETDljOomF3F6PItMCfzw2kpv1ODYg3leh/PdD30gCDyJHMsKFTrrbZMTJP6OyfcLgK0/diKs3Gncr@vger.kernel.org
X-Received: by 2002:a05:622a:4f:b0:474:dc44:28c4 with SMTP id
 d75a77b69052e-4750b4d3938mr107138931cf.38.1741269902594; Thu, 06 Mar 2025
 06:05:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250218115922.407816-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 15:04:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUN-wGtZPZMOKjK9jLoG4v36XWON-G-1x01vk+pX3bsXw@mail.gmail.com>
X-Gm-Features: AQ5f1Jr5FGGmyRUsY7dF6NNrna-C1X_Xx4h4D0DCZ6Sms6J1TfoVs9ByrC17zCQ
Message-ID: <CAMuHMdUN-wGtZPZMOKjK9jLoG4v36XWON-G-1x01vk+pX3bsXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Feb 2025 at 12:59, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable Mali-G31 (GPU) node on EVK board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

