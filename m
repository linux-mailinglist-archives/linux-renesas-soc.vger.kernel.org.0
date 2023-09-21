Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497B27A9F9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Sep 2023 22:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbjIUUZ2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Sep 2023 16:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjIUUZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Sep 2023 16:25:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0967C70F;
        Thu, 21 Sep 2023 10:36:36 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E66FC433CB;
        Thu, 21 Sep 2023 17:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695317449;
        bh=rQwERv8dKdHwaDi6a6xwWVgsYnuXNpiaD5h0nk6TXPE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=XwlaN4iHuACVwgxmz4s4/3/dBUtKzE/tr1p9MAXauBwFp9MRMDcgfGvfW8nb+J/5J
         +dVSeJWDGE7VzdUzgKGi5kKf2BU9t8RQ1JXei8jdx1QhbyCmTFhNeBEnQn6olNIY3u
         NwFAYc8WgxwtnWgkwlWmSkiBAjbMXO4BkrIUUZXSXQfVTi9MxPsbDUYjn6XFZMui48
         awna9/CoIgFbsljjhJKSGuabbJiQvUPnNOtDwNrhNHth9Gjgc/1bqP/nu7WQvKzKla
         1UHy3IXBOiESNkRpshB1dv6IWVD2M68W3tTMBU768Wf6/xC5P5hzIU8V29u2EizDMG
         soFb23gvh04Iw==
Message-ID: <f122b793-cd19-24d6-4898-982702554f2c@kernel.org>
Date:   Thu, 21 Sep 2023 10:30:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v4 00/23] Fix libata suspend/resume handling and code
 cleanup
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        John Garry <john.g.garry@oracle.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Paul Ausbeck <paula@soe.ucsc.edu>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Joe Breuer <linux-kernel@jmbreuer.net>,
        Chia-Lin Kao <acelan.kao@canonical.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20230920135439.929695-1-dlemoal@kernel.org>
 <CAMuHMdWHXC=qPTcLS9VeqfFy7Js84pd84oZqqWdd7E+bAHrcqw@mail.gmail.com>
 <CAMuHMdXeeDNjwErH7HfCtnxSYF2o-6ZnkDuOe8u_mX14WKqqBQ@mail.gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CAMuHMdXeeDNjwErH7HfCtnxSYF2o-6ZnkDuOe8u_mX14WKqqBQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023/09/21 2:22, Geert Uytterhoeven wrote:
> On Thu, Sep 21, 2023 at 11:21 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Wed, Sep 20, 2023 at 3:54 PM Damien Le Moal <dlemoal@kernel.org> wrote:
>>> The first 9 patches of this series fix several issues with suspend/resume
>>> power management operations in scsi and libata. The most significant
>>> changes introduced are in patch 4 and 5, where the manage_start_stop
>>> flag of scsi devices is split into the manage_system_start_stop and
>>> manage_runtime_start_stop flags to allow keeping scsi runtime power
>>> operations for spining up/down ATA devices but have libata do its own
>>> system suspend/resume device power state management using EH.
>>>
>>> The remaining patches are code cleanup that do not introduce any
>>> significant functional change.
>>>
>>> This series was tested on qemu and on various PCs and servers. I am
>>> CC-ing people who recently reported issues with suspend/resume.
>>> Additional testing would be much appreciated.
>>>
>>> Changes from v3:
>>>  * Corrected pathc 1 (typo in commit message and WARN_ON() removal)
>>>  * Changed path 3 as suggested by Niklas (moved definition of
>>>    ->slave_alloc)
>>>  * Rebased on rc2
>>>  * Added review tags
>>
>> Thanks for the update!
>>
>> I gave this a try on Renesas Salvator-XS with R-Car H3 ES2.0 and
>> a SATA hard drive:
>>   - The drive is spun up during system resume,
>>   - Accessing the drive after the system was resumed is instantaneous.
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert !

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
Damien Le Moal
Western Digital Research

