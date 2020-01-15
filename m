Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 558C313B8DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 06:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgAOFO3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 00:14:29 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41671 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbgAOFO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 00:14:29 -0500
Received: by mail-wr1-f67.google.com with SMTP id c9so14441996wrw.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jan 2020 21:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GkaaiWNwz+qLk6MBn6/v2/U2WtP9s7PZHQQeckfaXS0=;
        b=rB+L1ofAAmW/AGoUaavXjPvXvD8vfZNF+XxuNynvKqF2IiLcGZGaRppgfofu6fRqRE
         hIlRbwuO5PbFgz7fQeqcTzDh4N1YQUzSx7LpTzhpAZ0plt+NPB/ijHQ2f2+Kt5aPB5fZ
         JQvlU84YrDUue/v4k+/dcglGpVmW5jXG8T18E25Ho94+lCqXiIYOtq4FhAyP9FrRZUfT
         hwP3vyZYXp1seZ/DTY+GNdquPUHjrQ4QTF/TdVcDnfQps9exfIy3auQfU+GtBMjLKKkj
         s5SpMMXeCes0aavCYmD5lauELB6EOe/giYupd5J18KVyczw2mFhXbKr4xDmfJ1hXowVo
         AcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GkaaiWNwz+qLk6MBn6/v2/U2WtP9s7PZHQQeckfaXS0=;
        b=mvWnIPis3Bc2wX4Rp20W5S3xwg+FOyaLo5JMWEVVRRwUPddFnNjUWnuQg/aeGQRtY4
         L8FIU7htAxZ2emHmdCi99Npcq1LLseAiVUFg34M2kgqbHbaD+spiCUhE0BDxeNwDjQhr
         P3aI7oH3iEQwJOt/McAr2g6KZYy+sLmRYrG5wq5nr3mHnAEM/cZq7afkNSFz8C5v2fyv
         j+33VnIajqL5N3junGDzjB0jQblr6n7vkaXaZkrrPDv8CNM+66eQeCoaVqHc1bwcxbP5
         hPckZF2kIiTIvu8iC+Eco6Yf6ZIXS9P1dkzdNTcBJ7xDB6ZYcxmVRjEfS5KBPZLmkTIf
         pYMw==
X-Gm-Message-State: APjAAAXoae92bEzh1We+TAFp5KGT+YglbZ4p984IbWJHhnXN9SeRq1U1
        vIHg0VurTv5vsOcq1JjieTluyq79HgU=
X-Google-Smtp-Source: APXvYqz+V7Ojh808no3MT6bEHx+LDotECTzRt8tXKdUgTZONiZK1I7HLZDZfyHzIHmUaeJpxSHaQew==
X-Received: by 2002:adf:fe86:: with SMTP id l6mr28150110wrr.252.1579065267152;
        Tue, 14 Jan 2020 21:14:27 -0800 (PST)
Received: from [192.168.43.97] (cst-prg-10-109.cust.vodafone.cz. [46.135.10.109])
        by smtp.gmail.com with ESMTPSA id c5sm22521495wmd.42.2020.01.14.21.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2020 21:14:26 -0800 (PST)
Subject: Re: [RFC][PATCH] ARM: dts: renesas: Add missing ethernet PHY reset
 GPIO on Gen2 reference boards
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200112191315.118831-1-marek.vasut@gmail.com>
 <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <cfb752e0-46b5-1936-c3f1-8c6d781bebb5@gmail.com>
Date:   Wed, 15 Jan 2020 06:14:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWc97=-9yBF0CJDZpWH9ZGX9uoDY_t6E6TQNc4MO93W_w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 1/13/20 9:58 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

[...]

>>  arch/arm/boot/dts/r8a7790-lager.dts   | 1 +
>>  arch/arm/boot/dts/r8a7790-stout.dts   | 1 +
>>  arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
>>  arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
>>  arch/arm/boot/dts/r8a7793-gose.dts    | 1 +
>>  arch/arm/boot/dts/r8a7794-alt.dts     | 1 +
>>  arch/arm/boot/dts/r8a7794-silk.dts    | 1 +
> 
> I believe all of the above (except for stout) are available in Magnus' farm...
> 
> r8a7743-sk-rzg1m.dts and r8a7745-sk-rzg1e.dts need similar changes as
> r8a7791-porter.dts resp. r8a7794-silk.dts.

Do you have those two boards / can you prepare and test a patch ?

[...]
