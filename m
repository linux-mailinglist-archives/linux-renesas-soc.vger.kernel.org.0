Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7072EAC7AA
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  7 Sep 2019 18:39:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390247AbfIGQjW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Sep 2019 12:39:22 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46203 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730957AbfIGQjV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Sep 2019 12:39:21 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so9558144wrt.13;
        Sat, 07 Sep 2019 09:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Ewz0ztIR26NfPDvnJqc9EaB2dqfTC+2CIT8LpkOD4gQ=;
        b=EdxW9tfzeaqQUwnwmIWjLubCU3bVHZtOCJWcgFBlVhHrKyDQLE1XB31G7lBkqgeYSZ
         lOzK2X7e5rF8W+Ob+Ug5cuf5rAAtsXA6WgqO2XgHehqr0H2Wrx94KbgOQ0pks+YQR06K
         kuAIDxgL9qYoVu1PSBZLJswI4aYnz5fNuWHlED/wCJ9bgs3VBxKkbf81UsP8+fC1m7+h
         QsLt6qvNyNCjs/TNBi1JPE9AFAdb6YA+N5sjUiB7Pcg4ZUCpKxGL/U761gUF99jwLI8Y
         cNdVgP7wk8/DwuLAGdJ2/fsUJGFg5KpPaN8L2NJahlUBzkQSWLzysXxCGnxmpnXodE9f
         nZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ewz0ztIR26NfPDvnJqc9EaB2dqfTC+2CIT8LpkOD4gQ=;
        b=AMl/4ZY2IBM3IZQTN+0aSfYM24nAZDU3lWFQToDw/XbDK/IE99F5sVwHD/S36P5afw
         jQT9h77/CH7LjBNIHLQQ5JdIn+d6TXrT/Ss3cAvFR2R/dApkrFvpo7awOLhtVqplapV0
         Yf89wDxKSkciOHi+v0KVLVtzDD/0O9Pk6ORMxVSCd3xRvfZqXxMLtMjLWmHzPFPb+qCR
         H7dq/xrl8y/CDjoFuRteQjcAlBpHZIwxtngt/BWveJMwP9oIHxuV4VhRrCjkt5Sf83tL
         FB1FOEigbB9VjZRVW/ZgnM7Q+QGfjiNqA5AgggN4bknwed8VZ2AxKgv/tIck32F5p8OS
         p7RQ==
X-Gm-Message-State: APjAAAWbXV7DXRXEt0IpNmaQvksUhyPyfzLT98Meru3FHIUGLxgFZoro
        HN273a9xPgdQNfq77fpoQsPYQ3UJ
X-Google-Smtp-Source: APXvYqwYZJzxK4M2VoI/cUhD83eLbI3Srf1aEJ10kXQsMbHI41j7ThJ7/CBOi7AO1os6TkZppN5gqQ==
X-Received: by 2002:a5d:6588:: with SMTP id q8mr2180929wru.184.1567874359442;
        Sat, 07 Sep 2019 09:39:19 -0700 (PDT)
Received: from [192.168.1.4] (ip-86-49-35-8.net.upcbroadband.cz. [86.49.35.8])
        by smtp.gmail.com with ESMTPSA id k6sm18176459wrg.0.2019.09.07.09.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2019 09:39:18 -0700 (PDT)
Subject: Re: [PATCH] of: Fix of_empty_ranges_quirk()
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <20190809173321.19944-1-marek.vasut@gmail.com>
 <CAL_JsqJyYQ99ENOkNd6yzn1eYwLTGLNihFxtovSPJajtF9SVvg@mail.gmail.com>
 <10818888-6476-f4b1-1a2e-e10c3159327f@gmail.com>
 <5d393d4b-b8dc-39e1-991e-de367649cf58@gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <1fef7c3e-0a87-aec7-ee24-3bfc85041cd9@gmail.com>
Date:   Sat, 7 Sep 2019 17:15:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5d393d4b-b8dc-39e1-991e-de367649cf58@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 8/10/19 9:47 PM, Frank Rowand wrote:
> On 8/10/19 6:39 AM, Marek Vasut wrote:
>> On 8/10/19 12:34 AM, Rob Herring wrote:
>>> On Fri, Aug 9, 2019 at 11:33 AM <marek.vasut@gmail.com> wrote:
>>>>
>>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>
>>>> The of_empty_ranges_quirk() returns a mix of boolean and signed integer
>>>> types, which cannot work well.
>>>
>>> It never returns a negative. The negative is used as an uninitialized
>>> flag. Note quirk_state is static.
>>
>> It's still mixing boolean and signed int types though, which isn't right.
> 
> From a code readability aspect, Marek is correct.
> 
> The code author used "stupid (or clever) coding tricks" (tm) to save a
> little bit of memory.  A more readable implementation would be:
> 
> 
> static bool of_empty_ranges_quirk(struct device_node *np)
> {
>         /*
>          * As far as we know, the missing "ranges" problem only exists on Apple
> 	 * machines, so only enable the exception on powerpc. --gcl
>          */
> 
>         if (IS_ENABLED(CONFIG_PPC)) {
>                 /* Cache the result for global "Mac" setting */
>                 static int quirk_state_initialized = 0;
>                 static bool quirk_state;
> 
>                 /* PA-SEMI sdc DT bug */
>                 if (of_device_is_compatible(np, "1682m-sdc"))
>                         return true;
> 
>                 if (!quirk_state_initialized)
> 			quirk_state_initialized = 1;
>                         quirk_state =
>                                 of_machine_is_compatible("Power Macintosh") ||
>                                 of_machine_is_compatible("MacRISC");
>                 return quirk_state;
>         }
>         return false;
> }
> 
> 
> I would also rename of_empty_ranges_quirk() to something like
> of_missing_ranges_is_ok() or of_missing_ranges_allowed().
> "quirk" does not convey any useful information while my proposed rename
> describes what the function is actually checking for.
> 
> The comment that I added is currently in the caller of of_empty_ranges_quirk(),
> but instead belongs in of_empty_ranges_quirk().  When I read that comment in
> of_translate_one(), my reaction was to look for the check for powerpc in
> of_translate_one() and to be puzzled when I could not find it.  I also
> modified the comment for the changed context.  Thus the "--gcl" portion
> of the comment should also be removed from of_translate_one().
> 
> The more readable implementation (IMNSHO) uses slightly more memory and
> slightly more code, but it is more direct about what it is doing and thus
> more readable.

Thanks for the input, sorry for the delay, let me send a V2.

-- 
Best regards,
Marek Vasut
