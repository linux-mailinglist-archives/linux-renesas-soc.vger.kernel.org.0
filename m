Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0421D2C5CA7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 20:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404194AbgKZTiB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 14:38:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728078AbgKZTiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 14:38:00 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D2BC0613D4;
        Thu, 26 Nov 2020 11:38:00 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id t6so3937685lfl.13;
        Thu, 26 Nov 2020 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5QyGNLQXxlgfPVb7GFlTMWTGFOCo2TM20uYJcJe6adg=;
        b=tYjcVBLKofRyux7TmpRywDhK2h5xeftj8t6LIJX9Fdt6qwu8OPwg7NBnTKs30qKfl1
         wb5vXtGCYcVho2O3NW0jz8lJlFpR0eFbPQNEHirTDgdyfuVsvIuKuWS84PsJvikejCLs
         ozA1BrNb3k69cuPf6PAl2eEfuj4EcrpMOB+O2hgZ6KN+6JuX1CKeVAXOHMxnMVHksBvb
         Vj6QhWpVjOFU85WuZ2Yw1A81SccA7vSa9HxabwXLdZ7iiOzi89CeofTiQzZVUUnr2yUb
         LliDWx1v7Lgx/pI0+5XyJpQhAKo+id8yO0WVanaS3w09DmoNO7w2dE40v+QeBOpAynjU
         uaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5QyGNLQXxlgfPVb7GFlTMWTGFOCo2TM20uYJcJe6adg=;
        b=g6ADl+A3Zu8jIHfL6hFW6cMh0mKd8b8tq9o/ImHPL4oNDlHgR8DeLxgKZDc6ROoIPD
         TghCxU1/m4TPMTrHA7YV4mgNtMePjNMIGdFQCwjusLFEb0pZUEpARicw/TIc4ha2RHCg
         VEVziCt9ZoM5nV9cGvk30ff9PdqvfT85qNEDeU13tUDttaySQ2QIOQcMGlYLdDKfaKrq
         wk1vchOxzjKPYirIrFp3F2lCDKfPc/G3rXWxgFpsDtxkk/O0iL71jbLhJNyXrjFp46Wr
         kwKJHdlpKkj31BCfn+h2ezBh7p41u8uPoWbcwJw01xOQE98J1+sZaIVUMRGR07o8T1VM
         PJfg==
X-Gm-Message-State: AOAM531PHZ9La5taa+GygW/OUL9wID6NPMVF2+regDreCL6LPAo4mFKT
        Mv53fPFz0nzyCMj34yFW5gI=
X-Google-Smtp-Source: ABdhPJxPeCHQTiePLnWS07bgYBnjfw5VFvp2iXJdXUO4AX6rmkHZRIuoGt9lC3HQCvoSF5HUpEqPkQ==
X-Received: by 2002:a19:c815:: with SMTP id y21mr1816781lff.589.1606419478722;
        Thu, 26 Nov 2020 11:37:58 -0800 (PST)
Received: from ?IPv6:2a00:1fa0:4282:4e35:1b33:42ef:d169:a655? ([2a00:1fa0:4282:4e35:1b33:42ef:d169:a655])
        by smtp.gmail.com with ESMTPSA id 202sm416680lfg.203.2020.11.26.11.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 11:37:58 -0800 (PST)
Subject: Re: [PATCH v2 0/5] memory: renesas-rpc-if: Trivial fixes
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <a42dc8dd-9a67-bf5b-c289-ae73c5218dc5@gmail.com>
Date:   Thu, 26 Nov 2020 22:37:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 11/26/20 10:11 PM, Lad Prabhakar wrote:

> This patch series fixes trivial issues in RPC-IF driver.
> 
> Changes for v2:
> * Balanced PM in rpcif_disable_rpm
> * Fixed typo in patch 4/5
> * Dropped C++ style fixes patch

   The part that fixed the comment style wasd good, you should\ve kept it...

> * Included RB tags from Sergei
> 
> Cheers,
> Prabhakar
[...]

MBR, Sergei
