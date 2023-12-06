Return-Path: <linux-renesas-soc+bounces-753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED2F806589
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 04:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4512E281F6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Dec 2023 03:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20847CA69;
	Wed,  6 Dec 2023 03:17:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net [60.248.80.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 326291AA;
	Tue,  5 Dec 2023 19:17:19 -0800 (PST)
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3B63EGaR027290;
	Wed, 6 Dec 2023 11:14:16 +0800 (+08)
	(envelope-from peterlin@andestech.com)
Received: from APC323 (10.0.12.98) by ATCPCS16.andestech.com (10.0.1.222) with
 Microsoft SMTP Server id 14.3.498.0; Wed, 6 Dec 2023 11:14:12 +0800
Date: Wed, 6 Dec 2023 11:14:08 +0800
From: Yu-Chien Peter Lin <peterlin@andestech.com>
To: Inochi Amaoto <inochiama@outlook.com>
CC: Guo Ren <guoren@kernel.org>, <acme@kernel.org>, <adrian.hunter@intel.com>,
        <ajones@ventanamicro.com>, <alexander.shishkin@linux.intel.com>,
        <andre.przywara@arm.com>, <anup@brainfault.org>,
        <aou@eecs.berkeley.edu>, <atishp@atishpatra.org>,
        <conor+dt@kernel.org>, <conor.dooley@microchip.com>,
        <conor@kernel.org>, <devicetree@vger.kernel.org>,
        <dminus@andestech.com>, <evan@rivosinc.com>, <geert+renesas@glider.be>,
        <heiko@sntech.de>, <irogers@google.com>, <jernej.skrabec@gmail.com>,
        <jolsa@kernel.org>, <jszhang@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-perf-users@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <locus84@andestech.com>,
        <magnus.damm@gmail.com>, <mark.rutland@arm.com>, <mingo@redhat.com>,
        <n.shubin@yadro.com>, <namhyung@kernel.org>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <peterz@infradead.org>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>, <rdunlap@infradead.org>,
        <robh+dt@kernel.org>, <samuel@sholland.org>,
        <sunilvl@ventanamicro.com>, <tglx@linutronix.de>,
        <tim609@andestech.com>, <uwu@icenowy.me>, <wens@csie.org>,
        <will@kernel.org>, <ycliang@andestech.com>
Subject: Re: [PATCH v4 09/13] dt-bindings: riscv: Add T-Head PMU extension
 description
Message-ID: <ZW_nAMRDWoMo6t8r@APC323>
References: <ZWhT_VSpl2aksVK7@APC323>
 <IA1PR20MB4953460FE5BF431DD32CD860BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953460FE5BF431DD32CD860BB81A@IA1PR20MB4953.namprd20.prod.outlook.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 3B63EGaR027290

On Fri, Dec 01, 2023 at 09:14:00AM +0800, Inochi Amaoto wrote:
<...>
> >>
> >> Hi, Peter Lin:
> >>
> >> You can use the following two document to get all events:
> >> https://github.com/T-head-Semi/openc906/tree/main/doc
> >> https://github.com/T-head-Semi/openc910/tree/main/doc
> >>
> >> There are also some RTL code can describe these events:
> >> https://github.com/T-head-Semi/openc910/blob/e0c4ad8ec7f8c70f649d826ebd6c949086453272/C910_RTL_FACTORY/gen_rtl/pmu/rtl/ct_hpcp_top.v#L1123
> >> https://github.com/T-head-Semi/openc906/blob/af5614d72de7e5a4b8609c427d2e20af1deb21c4/C906_RTL_FACTORY/gen_rtl/pmu/rtl/aq_hpcp_top.v#L543
> >>
> >> The perf events json can also be used as document, this is already
> >> applied (with more detailed explanation):
> >> https://lore.kernel.org/all/IA1PR20MB495325FCF603BAA841E29281BBBAA@IA1PR20MB4953.namprd20.prod.outlook.com/
> >
> >Thanks for reaching out!
> >The updated description will be:
> >
> >- const: xtheadpmu
> >  description:
> >    The T-Head performance monitor extension for counter overflow, as ratified
> >    in commit bd9206 ("Initial commit") of Xuantie C906 user manual.
> >    https://github.com/T-head-Semi/openc906/tree/main/doc
> >
> >Is it OK with you?
> >
> 
> Please indicate chapter 12 and chapter 13.5 of the manual related to
> the PMU. And changed openc906 manual to openc910 manual because it is
> more updated.
> 
> If modified:
> 
> Reviewed-by: Inochi Amaoto <inochiama@outlook.com>

Got it! Thanks for the information.

Regards,
Peter Lin

