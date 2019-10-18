Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B6CDC97F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 17:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405921AbfJRPpP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 11:45:15 -0400
Received: from [217.140.110.172] ([217.140.110.172]:43240 "EHLO foss.arm.com"
        rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org with ESMTP
        id S2393226AbfJRPpO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 11:45:14 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D996FC8F;
        Fri, 18 Oct 2019 08:44:55 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3A7B3F718;
        Fri, 18 Oct 2019 08:44:54 -0700 (PDT)
Subject: Re: [PATCH V3 2/3] PCI: rcar: Do not abort on too many inbound
 dma-ranges
To:     Marek Vasut <marek.vasut@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        PCI <linux-pci@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@the-dreams.de>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
References: <CAL_Jsq+4uaFJzk5jUPw+KssZvnji0WDh+QcFMok99XXntEhNTQ@mail.gmail.com>
 <88099c4f-4fb4-626e-f66f-3eb8861dfb2c@gmail.com>
 <CAL_JsqLzmk5dfn0Re3y7VjY5ehE29vKLOV-2tM5B_jPbB2YiPQ@mail.gmail.com>
 <06d093b2-dcc2-a01f-fce0-5db0bc47325e@gmail.com>
 <CAMuHMdXjZs6Gvar3o7wXd2-1tkPtpt3qxZLG5vzDfrCG4d9SeQ@mail.gmail.com>
 <ca16e883-27d3-2cd0-7d71-fa9b169dcccd@gmail.com>
 <ccf8a4f9-1758-bafc-797c-714f06810db3@arm.com>
 <6af92fb1-a154-3e03-d239-0417da5a5094@gmail.com>
 <CAL_JsqKEjzO3s=bBf_TxTAXTzLTcX=8ccFXLfowhPOHWzNET9A@mail.gmail.com>
 <5a19fcd3-2071-334a-1c4a-59d07f4a387d@gmail.com>
 <20191018095345.GD25918@e121166-lin.cambridge.arm.com>
 <fd53f532-9b78-a64e-6d34-bda5a7639586@gmail.com>
 <ce7d16ab-31b8-0992-b1d7-24f4a652ce5f@arm.com>
 <3f2f3868-676c-edc4-0de1-d42b63186128@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <931e7132-b680-3e9a-bb1e-af05811907fc@arm.com>
Date:   Fri, 18 Oct 2019 16:44:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <3f2f3868-676c-edc4-0de1-d42b63186128@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 18/10/2019 15:26, Marek Vasut wrote:
> On 10/18/19 2:53 PM, Robin Murphy wrote:
>> On 18/10/2019 13:22, Marek Vasut wrote:
>>> On 10/18/19 11:53 AM, Lorenzo Pieralisi wrote:
>>>> On Thu, Oct 17, 2019 at 05:01:26PM +0200, Marek Vasut wrote:
>>>>
>>>> [...]
>>>>
>>>>>> Again, just handling the first N dma-ranges entries and ignoring the
>>>>>> rest is not 'configure the controller correctly'.
>>>>>
>>>>> It's the best effort thing to do. It's well possible the next
>>>>> generation
>>>>> of the controller will have more windows, so could accommodate the
>>>>> whole
>>>>> list of ranges.
>>
>> In the context of DT describing the platform that doesn't make any
>> sense. It's like saying it's fine for U-Boot to also describe a bunch of
>> non-existent CPUs just because future SoCs might have them. Just because
>> the system would probably still boot doesn't mean it's right.
> 
> It's the exact opposite of what you just described -- the last release
> of U-Boot currently populates a subset of the DMA ranges, not a
> superset. The dma-ranges in the Linux DT currently are a superset of
> available DRAM on the platform.

I'm not talking about the overall coverage of addresses - I've already 
made clear what I think about that - I'm talking about the *number* of 
individual entries. If the DT binding defines that dma-ranges entries 
directly represent bridge windows, then the bootloader for a given 
platform should never generate more entries than that platform has 
actual windows, because to do otherwise would be bogus.

>>>>> Thinking about this further, this patch should be OK either way, if
>>>>> there is a DT which defines more DMA ranges than the controller can
>>>>> handle, handling some is better than failing outright -- a PCI which
>>>>> works with a subset of memory is better than PCI that does not work
>>>>> at all.
>>>>
>>>> OK to sum it up, this patch is there to deal with u-boot adding multiple
>>>> dma-ranges to DT.
>>>
>>> Yes, this patch was posted over two months ago, about the same time this
>>> functionality was posted for inclusion in U-Boot. It made it into recent
>>> U-Boot release, but there was no feedback on the Linux patch until
>>> recently.
>>>
>>> U-Boot can be changed for the next release, assuming we agree on how it
>>> should behave.
>>>
>>>> I still do not understand the benefit given that for
>>>> DMA masks they are useless as Rob pointed out and ditto for inbound
>>>> windows programming (given that AFAICS the PCI controller filters out
>>>> any transaction that does not fall within its inbound windows by default
>>>> so adding dma-ranges has the net effect of widening the DMA'able address
>>>> space rather than limiting it).
>>>>
>>>> In short, what's the benefit of adding more dma-ranges regions to the
>>>> DT (and consequently handling them in the kernel) ?
>>>
>>> The benefit is programming the controller inbound windows correctly.
>>> But if there is a better way to do that, I am open to implement that.
>>> Are there any suggestions / examples of that ?
>>
>> The crucial thing is that once we improve the existing "dma-ranges"
>> handling in the DMA layer such that it *does* consider multiple entries
>> properly, platforms presenting ranges which don't actually exist will
>> almost certainly start going wrong, and are either going to have to fix
>> their broken bootloaders or try to make a case for platform-specific
>> workarounds in core code.
> Again, this is exactly the other way around, the dma-ranges populated by
> U-Boot cover only existing DRAM. The single dma-range in Linux DT covers
> even the holes without existing DRAM.
> 
> So even if the Linux dma-ranges handling changes, there should be no
> problem.

Say you have a single hardware window, and this DT property (1-cell 
numbers for simplicity:

	dma-ranges = <0x00000000 0x00000000 0x80000000>;

Driver reads one entry and programs the window to 2GB@0, DMA setup 
parses the first entry and sets device masks to 0x7fffffff, and 
everything's fine.

Now say we describe the exact same address range this way instead:

	dma-ranges = <0x00000000 0x00000000 0x40000000,
		      0x40000000 0x40000000 0x40000000>;

Driver reads one entry and programs the window to 1GB@0, DMA setup 
parses the first entry and sets device masks to 0x3fffffff, and *today*, 
things are suboptimal but happen to work.

Now say we finally get round to fixing the of_dma code to properly 
generate DMA masks that actually include all usable address bits, a user 
upgrades their kernel package, and reboots with that same DT...

Driver reads one entry and programs the window to 1GB@0, DMA setup 
parses all entries and sets device masks to 0x7fffffff, devices start 
randomly failing or throwing DMA errors half the time, angry user looks 
at the changelog to find that somebody decided their now-corrupted 
filesystem is less important than the fact that hey, at least the 
machine didn't refuse to boot because the DT was obviously wrong. Are 
you sure that shouldn't be a problem?


Now, if you want to read the DT binding as less strict and let it just 
describe some arbitrarily-complex set of address ranges that should be 
valid for DMA, that's not insurmountable; you just need more complex 
logic in your driver capable of calculating how best to cover *all* 
those ranges using the available number of windows.

Robin.
